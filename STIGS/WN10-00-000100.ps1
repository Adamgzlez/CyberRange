<#
.SYNOPSIS
    This PowerShell script ensures that the Internet Information System (IIS) or its subcomponents are not installed on a workstation.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-09
    Last Modified   : 2025-04-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000100

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-00-000100-Remediation.ps1 
#>

# Simple IIS uninstall script with forced restart
Write-Output "Uninstalling IIS..."
dism.exe /Online /Disable-Feature /FeatureName:IIS-WebServerRole /Remove
Write-Output "IIS has been removed. Restarting the computer now..."
