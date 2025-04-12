<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-AC-000010-Remediation.ps1 
#>

# Get the current account lockout threshold
$currentThreshold = (net accounts | Select-String "Lockout threshold").ToString().Split(":")[1].Trim()

# Check if the threshold is not already set to 3
if ($currentThreshold -ne "3") {
    # Set the Account Lockout Threshold to 3 invalid logon attempts
    net accounts /lockoutthreshold:3
    Write-Host "- Lockout threshold set to 3 attempts."
} else {
    # Inform that it is already set to 3
    Write-Host "- Lockout threshold is already set to 3 attempts."
}

