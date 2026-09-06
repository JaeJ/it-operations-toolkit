[CmdletBinding()]
param()

. "$PSScriptRoot\Get-ToolkitConfiguration.ps1"

$Configuration = Get-ToolkitConfiguration

$Overview = & "$PSScriptRoot\Get-ToolkitOverview.ps1"

$Dashboard = & "$PSScriptRoot\New-ToolkitDashboard.ps1"

$Validation = & "$PSScriptRoot\Get-ToolkitValidationStatus.ps1"

Write-Host ""
Write-Host "==========================================="
Write-Host " IT Operations Toolkit Status"
Write-Host "==========================================="
Write-Host ""

Write-Host "Environment : $($Configuration.Environment)"
Write-Host "Version     : $($Configuration.Version)"
Write-Host ""
Write-Host "Platform Health : $($Dashboard.PlatformHealth)"
Write-Host "Validation      : $($Validation.ValidationStatus)"
Write-Host ""
Write-Host "Installed Modules : $($Dashboard.InstalledModules)"
Write-Host "Healthy Modules   : $($Dashboard.HealthyModules)"
Write-Host "Warning Modules   : $($Dashboard.WarningModules)"
Write-Host "Critical Modules  : $($Dashboard.CriticalModules)"
Write-Host ""
Write-Host "Total Scripts     : $($Dashboard.TotalScripts)"
Write-Host "Total Tests       : $($Dashboard.TotalTests)"
Write-Host "Average Maturity  : $($Dashboard.AverageMaturity)"
Write-Host ""

$Overview |
    Sort-Object Module |
    Format-Table `
        Module,
        ScriptCount,
        TestCount,
        Health,
        Complete,
        MaturityScore `
        -AutoSize