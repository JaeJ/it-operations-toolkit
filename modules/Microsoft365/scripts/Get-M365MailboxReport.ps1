[CmdletBinding()]
param()

try {

    Get-EXOMailbox |
    Select-Object `
        DisplayName,
        PrimarySmtpAddress,
        RecipientTypeDetails

}
catch {

    Write-Error "Unable to retrieve mailbox information."

}
