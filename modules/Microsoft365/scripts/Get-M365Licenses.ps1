[CmdletBinding()]
param()

. "$PSScriptRoot\..\..\..\shared\Import-ToolkitModule.ps1"

try {

    Write-ToolkitLog `
        -Message "Retrieving Microsoft 365 licensing information."

    Get-MgSubscribedSku |
        Select-Object `
            SkuPartNumber,
            ConsumedUnits

}
catch {

    Write-ToolkitLog `
        -Level Error `
        -Message "Unable to retrieve Microsoft 365 licensing information."

}