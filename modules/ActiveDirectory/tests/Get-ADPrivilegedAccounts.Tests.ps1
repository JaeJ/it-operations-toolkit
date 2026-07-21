Describe "Get-ADPrivilegedAccounts Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-ADPrivilegedAccounts.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}