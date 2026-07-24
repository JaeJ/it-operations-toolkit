[CmdletBinding()]
param()

$Modules = @(
    "Networking",
    "Diagnostics",
    "ActiveDirectory",
    "Azure",
    "Microsoft365",
    "Reporting"
)

$ToolkitVersion = "2.1"

$ModuleSummary = foreach ($Module in $Modules) {

    $ModulePath = Join-Path `
        "$PSScriptRoot\..\modules" `
        $Module

    $ScriptCount = (
        Get-ChildItem `
            "$ModulePath\scripts" `
            -Filter "*.ps1" `
            -ErrorAction SilentlyContinue
    ).Count

    $TestCount = (
        Get-ChildItem `
            "$ModulePath\tests" `
            -Filter "*.Tests.ps1" `
            -ErrorAction SilentlyContinue
    ).Count

    [PSCustomObject]@{
        Module      = $Module
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