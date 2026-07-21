[CmdletBinding()]
param()

try {

    $OS = Get-CimInstance Win32_OperatingSystem

    [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        OS           = $OS.Caption
        LastBootTime = $OS.LastBootUpTime
        HealthStatus = "Healthy"
        ReportTime   = Get-Date
    }

}
catch {

    Write-Error "Unable to retrieve system health information."

}