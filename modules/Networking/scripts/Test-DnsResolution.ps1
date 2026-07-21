<#
.SYNOPSIS
Tests DNS resolution for a specified host.

.DESCRIPTION
Resolves one or more hostnames and reports the resulting IP addresses.

.PARAMETER Hostname
Host name to resolve.

.EXAMPLE
Test-DnsResolution.ps1 -Hostname github.com
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Hostname
)

try {

    $Results = Resolve-DnsName -Name $Hostname -ErrorAction Stop

    foreach ($Result in $Results) {

        [PSCustomObject]@{
            Hostname   = $Hostname
            IPAddress  = $Result.IPAddress
            RecordType = $Result.Type
        }

    }

}
catch {

    Write-Error "DNS resolution failed for $Hostname"

}