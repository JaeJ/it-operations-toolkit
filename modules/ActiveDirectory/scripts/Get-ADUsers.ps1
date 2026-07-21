<#
.SYNOPSIS
Retrieves Active Directory user accounts.

.DESCRIPTION
Returns user account information from Active Directory.

.EXAMPLE
Get-ADUsers.ps1
#>

[CmdletBinding()]
param()

try {

    Get-ADUser -Filter * |
    Select-Object `
        Name,
        SamAccountName,
        Enabled,
        LastLogonDate

}
catch {

    Write-Error "Unable to retrieve Active Directory users."

}