[CmdletBinding()]
param(

    [Parameter(Mandatory)]
    [string]$Target,

    [Parameter(Mandatory)]
    [int]$Port

)

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Testing port $Port on $Target."

    $TcpTest = Test-NetConnection `
        -ComputerName $Target `
        -Port $Port `
        -WarningAction SilentlyContinue

    [PSCustomObject]@{
        Target     = $Target
        Port       = $Port
        TcpSuccess = $TcpTest.TcpTestSucceeded
        CheckTime  = Get-Date
    }

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Port connectivity test failed for $Target on port $Port."

}