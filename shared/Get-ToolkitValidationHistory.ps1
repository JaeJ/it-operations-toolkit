[CmdletBinding()]
param()

$LogPath = Join-Path `
    $PSScriptRoot `
    "..\data\ValidationHistory.json"

if (Test-Path $LogPath) {

    Get-Content $LogPath |
        ConvertFrom-Json

}
else {

    [PSCustomObject]@{
        Message = "No validation history found."
    }

}