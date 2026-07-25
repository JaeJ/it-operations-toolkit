# IT Operations Toolkit

## Overview

The IT Operations Toolkit is an enterprise-focused portfolio project designed to demonstrate infrastructure engineering, systems administration, automation, reporting, troubleshooting, and cloud operations skills.

This project serves as the flagship repository that consolidates concepts and capabilities developed throughout:

- PowerShell Automation
- Infrastructure Scripts
- Azure Lab

into a unified operational platform.

---

## Business Problem

IT Operations teams are responsible for managing infrastructure, troubleshooting issues, monitoring systems, administering cloud resources, maintaining enterprise services, and producing operational reports.

Many organizations rely on multiple disconnected scripts and tools to perform these tasks.

The IT Operations Toolkit aims to provide a centralized framework for diagnostics, automation, reporting, administration, and operational visibility.

---

## Objectives

- Build a unified operational toolkit
- Standardize infrastructure administration workflows
- Improve troubleshooting efficiency
- Demonstrate infrastructure engineering practices
- Support cloud and on-premises administration
- Develop reusable automation modules
- Provide professional reporting capabilities
- Integrate shared services, configuration, and validation

---

## Core Modules

### Networking

- DNS Diagnostics
- Connectivity Testing
- Port Validation
- Network Reporting

### Diagnostics

- System Health Checks
- Service Analysis
- Event Log Reviews
- Error Investigation

### Active Directory

- User Reporting
- Group Reporting
- Administrative Audits
- Access Reviews

### Azure

- Resource Inventory
- Storage Reporting
- Virtual Machine Reporting
- Governance Reviews

### Microsoft 365

- Tenant Reporting
- Licensing Reviews
- User Audits
- Administration Reporting

### Reporting

- CSV Exports
- JSON Exports
- HTML Dashboards
- Executive Summaries

---

## Shared Services

Toolkit v2 introduced centralized shared services used across modules.

### Configuration Management

- Get-ToolkitConfiguration.ps1
- toolkit-config.json

### Initialization

- Initialize-Toolkit.ps1

### Logging

- Write-ToolkitLog.ps1

### Integration

- Import-ToolkitModule.ps1

### Health and Inventory

- Get-ToolkitOverview.ps1

### Dashboard Framework

- New-ToolkitDashboard.ps1
- Export-ToolkitDashboard.ps1

---

## Repository Structure

```text
it-operations-toolkit/
│
├── .github/
│   └── workflows/
│       └── toolkit-validation.yml
│
├── config/
│   └── toolkit-config.json
│
├── docs/
│   ├── architecture.md
│   ├── project-roadmap.md
│
├── examples/
│   ├── sample-output.md
│   └── toolkit-dashboard-output.md
│
├── images/
│   └── README.md
│
├── modules/
│   ├── Networking/
│   ├── Diagnostics/
│   ├── ActiveDirectory/
│   ├── Azure/
│   ├── Microsoft365/
│   └── Reporting/
│
├── shared/
│   ├── Get-ToolkitConfiguration.ps1
│   ├── Initialize-Toolkit.ps1
│   ├── Write-ToolkitLog.ps1
│   ├── Import-ToolkitModule.ps1
│   ├── Get