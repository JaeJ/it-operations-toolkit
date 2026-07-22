[CmdletBinding()]
param()

try {

    Get-MgUser |
    Select-Object `
        DisplayName,
        UserPrincipalName,
        AccountEnabled

}
catch {

    Write-Error "Unable to retrieve Microsoft 365 users."

}