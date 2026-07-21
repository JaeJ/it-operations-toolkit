[CmdletBinding()]
param(
    [int]$Newest = 10
)

try {

    Get-EventLog `
        -LogName System `
        -EntryType Error `
        -Newest $Newest |
    Select-Object `
        TimeGenerated,
        Source,
        EventID,
        Message

}
catch {

    Write-Error "Unable to retrieve system errors."

}