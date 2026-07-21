Describe "Test-PortConnectivity Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path $PSScriptRoot "..\scripts\Test-PortConnectivity.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}