[CmdletBinding()]
param()

try {

    Get-MgSubscribedSku |
    Select-Object `
        SkuPartNumber,
        ConsumedUnits

}
catch {

    Write-Error "Unable to retrieve Microsoft 365 licensing information."

}