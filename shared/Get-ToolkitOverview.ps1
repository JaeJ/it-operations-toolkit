[CmdletBinding()]
param()

$ToolkitSummary = [PSCustomObject]@{

    ToolkitVersion = "2.0"

    Networking      = "Installed"
    Diagnostics     = "Installed"
    ActiveDirectory = "Installed"
    Azure           = "Installed"
    Microsoft365    = "Installed"
    Reporting       = "Installed"

    GeneratedOn     = Get-Date
}

$ToolkitSummary