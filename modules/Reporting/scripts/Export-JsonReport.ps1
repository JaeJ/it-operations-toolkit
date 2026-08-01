[CmdletBinding()]
param(

    [Parameter(Mandatory)]
    [object]$InputObject,

    [Parameter(Mandatory)]
    [string]$Path

)

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Exporting JSON report to $Path."

    $InputObject |
        ConvertTo-Json |
        Set-Content `
        -Path $Path

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "JSON export failed."

}