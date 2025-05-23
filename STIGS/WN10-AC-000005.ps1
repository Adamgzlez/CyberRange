<#
.SYNOPSIS
    This PowerShell script ensures that the Windows 10 account lockout duration is configured to 15 minutes or greater.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-12
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

# Get the current lockout duration
$currentLockoutDuration = (net accounts | Select-String "Lockout duration").ToString().Split(":")[1].Trim()

# Set desired lockout duration
$desiredLockoutDuration = "15"

# Check if the current lockout duration is not set to the desired value
if ($currentLockoutDuration -ne $desiredLockoutDuration) {
    # Set Lockout Duration to 15 minutes
    net accounts /lockoutduration:$desiredLockoutDuration
    Write-Host "- Lockout duration set to $desiredLockoutDuration minutes."
} else {
    Write-Host "- Lockout duration is already set to $desiredLockoutDuration minutes."
}


