function Confirm-SchemaExists {
    Param(
        [string]$Database,
        [string]$SqlServer
    )
    
    $Query = "SELECT 1 FROM $Database.sys.schemas WHERE name = '$Schema'"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults) {
        return $true
    }
    return $false
}