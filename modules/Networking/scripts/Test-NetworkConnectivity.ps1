<#
.SYNOPSIS
Tests network connectivity to a target host.

.DESCRIPTION
Performs ICMP connectivity testing and returns basic connectivity results.

.PARAMETER Target
Hostname or IP address to test.

.EXAMPLE
Test-NetworkConnectivity.ps1 -Target github.com
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Target
)

try {

    $Result = Test-Connection -ComputerName $Target -Count 2 -Quiet -ErrorAction Stop

    [PSCustomObject]@{
        Target       = $Target
        Reachable    = $Result
        CheckTime    = Get-Date
    }

}
catch {

    Write-Error "Connectivity test failed for $Target"

}