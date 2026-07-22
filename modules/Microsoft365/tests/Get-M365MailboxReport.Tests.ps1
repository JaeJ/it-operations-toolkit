Describe "Get-M365MailboxReport Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-M365MailboxReport.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}