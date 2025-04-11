<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
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

# Define the desired reset period in minutes
$resetPeriod = 15  # Change this value as needed

# Get current local account lockout window
$currentSettings = net accounts
$currentWindowLine = $currentSettings | Where-Object { $_ -match "Lockout observation window" }

if ($currentWindowLine) {
    # Extract the number of minutes from the line
    $currentWindow = ($currentWindowLine -split ":" )[1].Trim() -replace "minutes", "" -as [int]

    # Check if current value matches desired value
    if ($currentWindow -ne $resetPeriod) {
        # Apply the reset account lockout counter time
        net accounts /lockoutwindow:$resetPeriod

        # Output a summary of the configured account lockout policy
        Write-Host "Account lockout policy updated:"
        Write-Host "- Reset counter after: $resetPeriod minutes"
    } else {
        # If already set, inform the user
        Write-Host "No changes needed. Reset counter is already set to $resetPeriod minutes."
    }
} else {
    Write-Host "Could not find the 'Lockout observation window' setting in current policy."
}



