[CmdletBinding()]
param(

    [Parameter(Mandatory)]
    [string]$Message,

    [ValidateSet("Information","Warning","Error")]
    [string]$Level = "Information"

)

$ConfigPath = Join-Path `
    $PSScriptRoot `
    "..\config\toolkit-config.json"

$Configuration = Get-Content `
    $ConfigPath |
    ConvertFrom-Json

if (-not (Test-Path $Configuration.LogPath)) {

    New-Item `
        -Path $Configuration.LogPath `
        -ItemType Directory `
        -Force | Out-Null

}

$LogFile = Join-Path `
    $Configuration.LogPath `
    "Toolkit.log"

$Timestamp = Get-Date `
    -Format "yyyy-MM-dd HH:mm:ss"

$Entry = "[$Timestamp] [$Level] $Message"

Write-Output $Entry

Add-Content `
    -Path $LogFile `
    -Value $Entry
