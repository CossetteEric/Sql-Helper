function Confirm-OwnerExists {
    Param(
        [string]$Owner,
        [string]$SqlServer
    )
    
    $Query = "SELECT 1 FROM master.dbo.syslogins WHERE name = '$Owner'"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults) {
        return $true
    }
    return $false
}