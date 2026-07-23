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

$ToolkitVersion = "2.0"

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
        Status      = "Installed"
    }

}

Write-Host ""
Write-Host "IT Operations Toolkit v$ToolkitVersion"
Write-Host "======================================"
Write-Host ""

$ModuleSummary | Format-Table -AutoSize

Write-Host ""
Write-Host "Modules Installed: $($ModuleSummary.Count)"
Write-Host "Total Scripts: $($ModuleSummary.ScriptCount | Measure-Object -Sum | Select-Object -ExpandProperty Sum)"
Write-Host "Total Tests: $($ModuleSummary.TestCount | Measure-Object -Sum | Select-Object -ExpandProperty Sum)"