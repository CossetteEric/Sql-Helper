function Get-Headers {
    Param(
        [string]$Database,
        [string]$Schema,
        [string]$Table,
        [string]$SqlServer
    )
    $Query = "SELECT COLUMN_NAME FROM $Database.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = '$Schema' AND TABLE_NAME = '$Table'"
    $QueryResults = Invoke-Query $Query $SqlServer
    return $QueryResults | % {$_.COLUMN_NAME}
}