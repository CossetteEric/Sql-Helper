function Confirm-SSISPackageExists {
    Param(
        [string]$Path,
        [string]$SqlServer
    )
    
    $Parts = $Path.Split('\') | ? {$_}
    $Database = $Parts[0]
    $Folders = [string[]]@($Parts[0..($Parts.Length - 2)])
    $Package = $Parts[($Parts.Length - 1)]
    
    $Query = "SELECT * FROM $Database.dbo.sysssispackagefolders WHERE foldername IN ('$($Folders -Join "', '")')"
    $QueryResults = Invoke-Query $Query $SqlServer
    
    if (!$QueryResults) {
        return $false
    }
    
    $Root = $QueryResults | ? {$_.foldername -eq $Folders[0] -and $_.parentfolderid -eq "00000000-0000-0000-0000-000000000000"}
    $FolderPath = [hashtable[]]@($Root)
    
    for ($i = 1; $i -lt $Folders.Length; i++) {
        $Folder = $Folders[$i]
        $ParentFolder = $FolderPath[($i - 1)]
        $ChildFolder = $QueryResults | ? {$_.parentfolderid -eq $ParentFolder.folderid -and $_.foldername -eq $Folder}
        $FolderPath += $ChildFolder
    }
    
    if ($FolderPath.Length -ne $Folders.Length) {
        return $false
    }
    
    $PackageFolder = $FolderPath[($FolderPath.Length - 1)]
    
    $PackageQuery = "SELECT 1 FROM $Database.dbo.sysssispackages WHERE name = '$Package' AND folderid = '$($PackageFolder.folderid)'"
    $PackageQueryResults = Invoke-Query $Query $SqlServer
    
    if (!$PackageQueryResults) {
        return $false
    }
    return $true
}