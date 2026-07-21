Describe "Test-NetworkConnectivity Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Test-NetworkConnectivity.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}