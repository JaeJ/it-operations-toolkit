[CmdletBinding()]
param()

Write-Host "Initializing IT Operations Toolkit..."

$ConfigPath = Join-Path $PSScriptRoot "..\\config\\toolkit-config.json"

if (Test-Path $ConfigPath) {

    Write-Host "Configuration loaded."

}
else {

    Write-Error "Toolkit configuration not found."

}