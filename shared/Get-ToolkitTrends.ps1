[CmdletBinding()]
param()

$Overview = & "$PSScriptRoot\Get-ToolkitOverview.ps1"

[PSCustomObject]@{
    ModuleCount    = $Overview.Count
    ScriptCount    = ($Overview.ScriptCount | Measure-Object -Sum).Sum
    TestCount      = ($Overview.TestCount | Measure-Object -Sum).Sum
    AverageMaturity = (
        $Overview.MaturityScore |
        Measure-Object -Average
    ).Average
    GeneratedOn    = Get-Date
}