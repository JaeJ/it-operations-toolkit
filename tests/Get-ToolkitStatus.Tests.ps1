Describe "Get-ToolkitStatus Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "..\shared\Get-ToolkitStatus.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}