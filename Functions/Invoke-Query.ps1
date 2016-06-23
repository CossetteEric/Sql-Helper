function Invoke-Query {
    Param(
        [string]$Query,
        [string]$SqlServer
    )

    return Invoke-SqlCmd -ServerInstance $SqlServer -Query $Query -QueryTimeout ([int]::MaxValue)
}