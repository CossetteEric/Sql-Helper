if ((Get-PSSnapin -Name SqlServerCmdletSnapin100 -ErrorAction SilentlyContinue) -eq $null) {
    Add-PSSnapin SqlServerCmdletSnapin100
}
if ((Get-PSSnapin -Name SqlServerProviderSnapin100 -ErrorAction SilentlyContinue) -eq $null) {
    Add-PSSnapin SqlServerProviderSnapin100
}

$moduleRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

"$moduleRoot\Functions\*.ps1" | Resolve-Path |
    ? {!($_.ProviderPath.ToLower().Contains(".tests."))} |
    % {. $_.ProviderPath}

Export-ModuleMember -function "Invoke-Query"
Export-ModuleMember -function "Confirm-DatabaseExists"
Export-ModuleMember -function "Confirm-SchemaExists"
Export-ModuleMember -function "Confirm-TableExists"
Export-ModuleMember -function "Confirm-ColumnExists"
Export-ModuleMember -function "Confirm-ProcedureExists"
Export-ModuleMember -function "Confirm-JobExists"
Export-ModuleMember -function "Confirm-OwnerExists"
Export-ModuleMember -function "Confirm-SSISPackageExists"