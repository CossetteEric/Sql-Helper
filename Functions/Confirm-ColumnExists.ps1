function Confirm-ColumnExists {
    Param(
        [string]$Database,
        [string]$Schema,
        [string]$Table,
        [string]$Column,
        [string]$SqlServer
    )
    
    $Query = "SELECT 1 FROM $Database.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '$Schema' AND TABLE_NAME = '$Table' AND COLUMN_NAME = '$column'"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults) {
        return $true
    }
    return $false
}