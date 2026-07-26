[CmdletBinding()]
param()

$ModulesPath = Join-Path `
    $PSScriptRoot `
    "..\modules"

$ToolkitVersion = "3.0"

$Modules = Get-ChildItem `
    -Path $ModulesPath `
    -Directory

$ModuleSummary = foreach ($Module in $Modules) {

    $ModulePath = $Module.FullName

    $ScriptCount = (
        Get-ChildItem `
            -Path "$ModulePath\scripts" `
            -Filter "*.ps1" `
            -ErrorAction SilentlyContinue
    ).Count

    $TestCount = (
        Get-ChildItem `
            -Path "$ModulePath\tests" `
            -Filter "*.Tests.ps1" `
            -ErrorAction SilentlyContinue
    ).Count

    [PSCustomObject]@{
        Module      = $Module.Name
        ScriptCount = $ScriptCount
        TestCount   = $TestCount
        Health      = if ($ScriptCount -eq $TestCount) {
            "Healthy"
        }
        else {
            "Review"
        }
    }

}

$ModuleSummary | Format-Table -AutoSize

Write-Host ""

Write-Host "Toolkit Version: $ToolkitVersion"

Write-Host "Installed Modules: $($ModuleSummary.Count)"

Write-Host "Total Scripts: $(
    ($ModuleSummary.ScriptCount |
        Measure-Object -Sum).Sum
)"

Write-Host "Total Tests: $(
    ($ModuleSummary.TestCount |
        Measure-Object -Sum).Sum
)"