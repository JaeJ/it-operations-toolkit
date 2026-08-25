[CmdletBinding()]
param()

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

$ToolkitData = & $OverviewScript

$InstalledModules = $ToolkitData.Count

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

$TotalScripts = (
    $ToolkitData.ScriptCount |
    Measure-Object -Sum
).Sum

$TotalTests = (
    $ToolkitData.TestCount |
    Measure-Object -Sum
).Sum

$AverageMaturity = :Round(
    (
        $ToolkitData.MaturityScore |
        Measure-Object -Average
    ).Average,
    0
)

$PlatformHealth = if ($CriticalModules -gt 0) {

    "Critical"

}
elseif ($WarningModules -gt 0) {

    "Warning"

}
else {

    "Healthy"

}

[PSCustomObject]@{
    InstalledModules  = $InstalledModules
    HealthyModules    = $HealthyModules
    WarningModules    = $WarningModules
    CriticalModules   = $CriticalModules
    TotalScripts      = $TotalScripts
    TotalTests        = $TotalTests
    AverageMaturity   = $AverageMaturity
    PlatformHealth    = $PlatformHealth
    GeneratedOn       = Get-Date
}