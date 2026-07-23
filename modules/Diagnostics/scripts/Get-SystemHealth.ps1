[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Write-ToolkitLog.ps1"

try {

    $OS = Get-CimInstance Win32_OperatingSystem

    $Result = [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        OS           = $OS.Caption
        LastBootTime = $OS.LastBootUpTime
        HealthStatus = "Healthy"
        ReportTime   = Get-Date
    }

    Write-ToolkitLog `
        -Message "System health report generated successfully."

    $Result

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve system health information."

}