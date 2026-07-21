Describe "Get-SystemErrors Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-SystemErrors.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}