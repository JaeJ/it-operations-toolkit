Describe "Get-ToolkitValidationStatus Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "..\shared\Get-ToolkitValidationStatus.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}