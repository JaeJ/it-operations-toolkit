[CmdletBinding()]
param()

try {

    Get-Service |
        Where-Object Status -eq 'Running' |
        Select-Object Name, DisplayName, Status

}
catch {

    Write-Error "Unable to retrieve running services."

}