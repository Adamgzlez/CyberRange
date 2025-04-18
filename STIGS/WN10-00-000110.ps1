<#
.SYNOPSIS
    This PowerShell script ensures that Simple TCP/IP Services are not installed on the system.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000110 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__WN10-00-000110-Remediation.ps1 
#>

# Check if the feature is installed
$feature = Get-WindowsOptionalFeature -Online -FeatureName "SimpleTCP"

if ($feature.State -eq "Enabled") {
    Write-Output "Simple TCP/IP Services is installed. Attempting to uninstall..."

    # Disable (uninstall) the feature
    Disable-WindowsOptionalFeature -Online -FeatureName "SimpleTCP" -NoRestart

    Write-Output "Simple TCP/IP Services has been uninstalled."
} else {
    Write-Output "Simple TCP/IP Services is not installed. No action needed."
}
