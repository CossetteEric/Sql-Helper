function Confirm-ColumnIsEmpty {
    Param(
        [string]$Database,
        [string]$Schema,
        [string]$Table,
        [string]$Header,
        [string]$SqlServer
    )
    
    $Query = "SELECT $Header, COUNT(1) Total FROM $Database.$Schema.[$Table] GROUP BY $Header"
    $QueryResults = Invoke-Query $Query $SqlServer
    return $QueryResults.Total
}