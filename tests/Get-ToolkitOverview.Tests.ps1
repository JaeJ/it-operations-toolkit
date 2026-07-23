Describe "Get-ToolkitOverview Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "..\shared\Get-ToolkitOverview.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}