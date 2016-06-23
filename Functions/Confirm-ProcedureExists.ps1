function Confirm-ProcedureExists {
    Param(
        [string]$Database,
        [string]$Schema,
        [string]$Procedure,
        [string]$SqlServer
    )
    
    $Query = "SELECT 1 FROM [$Database].sys.objects WHERE type = 'P' AND object_id = OBJECT_ID('[$Database].[$Schema].[$Procedure]')"
    $QueryResults = Invoke-Query $Query $SqlServer
    if ($QueryResults) {
        return $true
    }
    return $false
}