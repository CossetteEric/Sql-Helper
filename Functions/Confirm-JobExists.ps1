function Confirm-JobExists {
    Param(
        [string]$Job,
        [string]$SqlServer
    )
    
    $Query = "SELECT 1 FROM msdb.dbo.sysjobs WHERE name = N'$Job'"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults) {
        return $true
    }
    return $false
}