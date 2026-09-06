[CmdletBinding()]
param()

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

$ToolkitData = & $OverviewScript

$HealthyModules = (
    $ToolkitData |
    Where-Object Health -eq "Healthy"
).Count

$WarningModules = (
    $ToolkitData |
    Where-Object Health -eq "Warning"
).Count

$CriticalModules = (
    $ToolkitData |
    Where-Object Health -eq "Critical"
).Count

$ValidationStatus = if ($CriticalModules -gt 0) {

    "Failed"

}
elseif ($WarningModules -gt 0) {

    "Warning"

}
else {

    "Passed"

}

[PSCustomObject]@{
    ValidationStatus = $ValidationStatus
    ModulesValidated = $ToolkitData.Count
    HealthyModules   = $HealthyModules
    WarningModules   = $WarningModules
    CriticalModules  = $CriticalModules
    ValidationDate   = Get-Date
}