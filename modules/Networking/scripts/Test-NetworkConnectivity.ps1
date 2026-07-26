[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Target
)

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Testing connectivity to $Target."

    $Result = Test-Connection `
        -ComputerName $Target `
        -Count 2 `
        -Quiet `
        -ErrorAction Stop

    [PSCustomObject]@{
        Target     = $Target
        Reachable  = $Result
        CheckTime  = Get-Date
    }

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Connectivity test failed for $Target."

}