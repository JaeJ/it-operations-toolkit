Describe "New-ToolkitDashboard Script" {

    It "Script Exists" {

        $ScriptPath = Join-Path `
            $PSScriptRoot `
            "..\shared\New-ToolkitDashboard.ps1"

        Test-Path $ScriptPath | Should -BeTrue

    }

}