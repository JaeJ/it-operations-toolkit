[CmdletBinding()]
param()

. "$PSScriptRoot\Get-ToolkitConfiguration.ps1"
. "$PSScriptRoot\Get-ToolkitOverview.ps1"
. "$PSScriptRoot\New-ToolkitDashboard.ps1"

try {

    $Configuration = Get-ToolkitConfiguration

    $Overview = Get-ToolkitOverview

    $Dashboard = New-ToolkitDashboard

    Write-Host ""
    Write-Host "========================================="
    Write-Host " IT Operations Toolkit Status"
    Write-Host "========================================="
    Write-Host ""

    Write-Host "Environment : $($Configuration.Environment)"
    Write-Host "Version     : $($Configuration.Version)"
    Write-Host "Report Path : $($Configuration.ReportPath)"
    Write-Host "Log Path    : $($Configuration.LogPath)"

    Write-Host ""
    Write-Host "Platform Health"
    Write-Host "---------------"

    Write-Host "Installed Modules : $($Dashboard.InstalledModules)"
    Write-Host "Healthy Modules   : $($Dashboard.HealthyModules)"
    Write-Host "Warning Modules   : $($Dashboard.WarningModules)"
    Write-Host "Critical Modules  : $($Dashboard.CriticalModules)"

    Write-Host ""
    Write-Host "Platform Metrics"
    Write-Host "----------------"

    Write-Host "Total Scripts     : $($Dashboard.TotalScripts)"
    Write-Host "Total Tests       : $($Dashboard.TotalTests)"
    Write-Host "Average Maturity  : $($Dashboard.AverageMaturity)"
    Write-Host "Platform Health   : $($Dashboard.PlatformHealth)"

    Write-Host ""
    Write-Host "Module Summary"
    Write-Host "--------------"

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

}
catch {

    Write-Error "Unable to generate toolkit status report."

}