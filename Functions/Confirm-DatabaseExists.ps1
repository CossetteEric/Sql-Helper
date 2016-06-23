function Confirm-DatabaseExists {
    Param(
        [string]$Database,
        [string]$SqlServer
    )
    
    $Query = "SELECT DB_ID('$Database') Id"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults.Id) {
        return $true
    }
    return $false
}