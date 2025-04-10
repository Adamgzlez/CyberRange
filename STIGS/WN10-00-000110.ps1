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
