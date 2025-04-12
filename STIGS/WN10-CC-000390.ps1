<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 is configured to prevent users from receiving suggestions for third-party or additional applications.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000390

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000390-Remediation.ps1 
#>

# Define the registry path
$registryPath = "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the DWORD value
New-ItemProperty -Path $registryPath -Name "DisableThirdPartySuggestions" -PropertyType DWord -Value 1 -Force

Write-Output "Registry key set successfully."
