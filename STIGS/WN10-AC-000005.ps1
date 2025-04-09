<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2025-04-09
    Last Modified   : 2025-04-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AC-000005-Remediation.ps1 
#>

# Set Account Lockout Threshold: 10 invalid logon attempts
net accounts /lockoutthreshold:10

# Set Account Lockout Duration: 15 minutes
net accounts /lockoutduration:15

# Reset Account Lockout Counter After: 10 minutes
net accounts /lockoutwindow:10

# Output a summary of the configured account lockout policy
Write-Host "Account lockout policy configured:"
Write-Host "- Lockout threshold: 10 attempts"
Write-Host "- Lockout duration: 15 minutes"
Write-Host "- Reset counter after: 10 minutes"

