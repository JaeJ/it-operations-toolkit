[CmdletBinding()]
param()

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

$ToolkitData = & $OverviewScript

$Dashboard = [PSCustomObject]@{

    ToolkitVersion = "3.0"

    InstalledModules = $ToolkitData.Count

    HealthyModules = (
        $ToolkitData |
        Where-Object Health -eq "Healthy"
    ).Count

    ReviewModules = (
        $ToolkitData |
        Where-Object Health -eq "Review"
    ).Count

    TotalScripts = (
        $ToolkitData.ScriptCount |
        Measure-Object -Sum
    ).Sum

    TotalTests = (
        $ToolkitData.TestCount |
        Measure-Object -Sum
    ).Sum

    GeneratedOn = Get-Date
}

$Dashboard