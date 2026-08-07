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
        -Message "Exporting HTML report to $Path."

    $InputObject |
        ConvertTo-Html |
        Set-Content `
            -Path $Path

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "HTML report export failed."

}