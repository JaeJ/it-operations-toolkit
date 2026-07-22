[CmdletBinding()]
param()

try {

    Get-AzVM |
    Select-Object `
        Name,
        Location,
        ResourceGroupName

}
catch {

    Write-Error "Unable to retrieve Azure VM information."

}