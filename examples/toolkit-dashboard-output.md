# IT Operations Toolkit Dashboard Example

## Platform Summary

```text
Toolkit Version : 4.0
Installed Modules : 6
Healthy Modules : 6
Review Modules : 0
```

---

## Configuration-Driven Reporting

```text
Report Path : C:\Toolkit\Reports
Dashboard   : ToolkitDashboard.html
```

---

## Platform Capabilities

- Automatic Module Discovery
- Configuration-Driven Behavior
- Shared Logging
- Health Reporting
- Dashboard Generation
- HTML Export
- Automated Testing
- Module Validation

---

## Dashboard Workflow

```text
Get-ToolkitOverview.ps1
            ↓
New-ToolkitDashboard.ps1
            ↓
Export-ToolkitDashboard.ps1
            ↓
ReportPath From Configuration
            ↓
ToolkitDashboard.html
```