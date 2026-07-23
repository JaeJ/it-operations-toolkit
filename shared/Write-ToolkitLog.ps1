[CmdletBinding()]
param(

    [Parameter(Mandatory)]
    [string]$Message,

    [ValidateSet("Information","Warning","Error")]
    [string]$Level = "Information"

)

$Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

Write-Output "[$Timestamp] [$Level] $Message"