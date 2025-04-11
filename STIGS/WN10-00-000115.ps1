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
    STIG-ID         : WN10-00-000115

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-00-000115-Remediation.ps1 
#>

# Check if Telnet Client is installed
$feature = Get-WindowsOptionalFeature -Online -FeatureName TelnetClient

if ($feature.State -eq "Enabled") {
    Write-Output "Telnet Client is installed. Proceeding to uninstall..."

    # Disable the Telnet Client feature
    Disable-WindowsOptionalFeature -Online -FeatureName TelnetClient -NoRestart

    Write-Output "Telnet Client has been uninstalled successfully."
} else {
    Write-Output "Telnet Client is not installed on this system."
}
