[CmdletBinding()]
param()

$OverviewScript = Join-Path `
    $PSScriptRoot `
    "Get-ToolkitOverview.ps1"

$ToolkitData = & $OverviewScript

$Dashboard = [PSCustomObject]@{

    ToolkitVersion = "2.0"

    InstalledModules = $ToolkitData.Count

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