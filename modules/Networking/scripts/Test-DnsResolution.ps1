[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Hostname
)

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Resolving DNS for $Hostname."

    $Results = Resolve-DnsName `
        -Name $Hostname `
        -ErrorAction Stop

    foreach ($Result in $Results) {

        [PSCustomObject]@{
            Hostname   = $Hostname
            IPAddress  = $Result.IPAddress
            RecordType = $Result.Type
        }

    }

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "DNS resolution failed for $Hostname."

}