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
        -Message "Exporting CSV report to $Path."

    $InputObject |
        Export-Csv `
        -Path $Path `
        -NoTypeInformation

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "CSV report export failed."

}