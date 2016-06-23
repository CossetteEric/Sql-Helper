
if (@(Get-PSSnapin | ? {$_.Name -eq "SqlServerCmdletSnapin100"}).Length -gt 0) {
    Remove-PSSnapin SqlServerCmdletSnapin100
}
if (@(Get-PSSnapin | ? {$_.Name -eq "SqlServerProviderSnapin100"}).Length -gt 0) {
    Remove-PSSnapin SqlServerProviderSnapin100
}

Add-PSSnapin SqlServerCmdletSnapin100
Add-PSSnapin SqlServerProviderSnapin100

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