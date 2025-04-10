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
    STIG-ID         : WN10-AC-000015

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AC-000015-Remediation.ps1 
#>

# Define the reset period in minutes
$resetPeriod = 15  # Change this value as needed

# Apply the reset account lockout counter time (for local accounts policy)
net accounts /lockoutwindow:$resetPeriod

# Output a summary of the configured account lockout policy
Write-Host "Account lockout policy updated:"
Write-Host "- Reset counter after: $resetPeriod minutes"

