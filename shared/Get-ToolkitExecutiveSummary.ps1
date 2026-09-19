[CmdletBinding()]
param()

$Dashboard = & "$PSScriptRoot\New-ToolkitDashboard.ps1"

Write-Host ""
Write-Host "========================================="
Write-Host " IT Operations Toolkit Executive Summary"
Write-Host "========================================="
Write-Host ""

Write-Host "Platform Health    : $($Dashboard.PlatformHealth)"
Write-Host "Installed Modules  : $($Dashboard.InstalledModules)"
Write-Host "Healthy Modules    : $($Dashboard.HealthyModules)"
Write-Host "Warning Modules    : $($Dashboard.WarningModules)"
Write-Host "Critical Modules   : $($Dashboard.CriticalModules)"
Write-Host "Average Maturity   : $($Dashboard.AverageMaturity)"
Write-Host "Total Scripts      : $($Dashboard.TotalScripts)"
Write-Host "Total Tests        : $($Dashboard.TotalTests)"
Write-Host "Generated On       : $($Dashboard.GeneratedOn)"
Write-Host ""
Write-Host "Executive Status: Platform operating normally."