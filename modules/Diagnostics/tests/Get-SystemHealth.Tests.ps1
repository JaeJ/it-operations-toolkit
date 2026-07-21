Describe "Get-SystemHealth Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Get-SystemHealth.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}