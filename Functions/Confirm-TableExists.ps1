function Confirm-TableExists {
    Param(
        [string]$Database,
        [string]$Schema,
        [string]$Table,
        [string]$SqlServer
    )
    
    $Query = "SELECT 1 FROM $Database.INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '$Schema' AND TABLE_NAME = '$Table'"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults) {
        return $true
    }
    return $false
}