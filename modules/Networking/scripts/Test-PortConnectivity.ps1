<#
.SYNOPSIS
Tests TCP port connectivity to a target host.

.DESCRIPTION
Attempts to establish a TCP connection to a specified host and port.

.PARAMETER Target
Hostname or IP address.

.PARAMETER Port
TCP port number.

.EXAMPLE
Test-PortConnectivity.ps1 -Target github.com -Port 443
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Target,

    [Parameter(Mandatory)]
    [int]$Port
)

try {

    $TcpTest = Test-NetConnection `
        -ComputerName $Target `
        -Port $Port `
        -WarningAction SilentlyContinue

    [PSCustomObject]@{
        Target      = $Target
        Port        = $Port
        TcpSuccess  = $TcpTest.TcpTestSucceeded
        CheckTime   = Get-Date
    }

}
catch {

    Write-Error "Port test failed for $Target on port $Port"

}