function Get-TableRowCount {
    Param(
        [string]$Database,
        [string]$Schema,
        [string]$Table,
        [string]$SqlServer
    )
    
    $Query = "SELECT COUNT(1) Total FROM $Database.$Schema.[$Table]"
    $QueryResults = Invoke-Query $Query $SqlServer
    return $QueryResults.Total
}