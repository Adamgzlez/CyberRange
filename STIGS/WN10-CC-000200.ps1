<#
.SYNOPSIS
    This PowerShell script ensures that the password history is configured to 24 passwords remembered.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2024-04-08
    Last Modified   : 2024-04-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000200

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000200-Remediation.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI"

# Check if the key exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the EnumerateAdministrators DWORD value to 0
New-ItemProperty -Path $registryPath -Name "EnumerateAdministrators" -PropertyType DWord -Value 0 -Force

Write-Output "Registry key updated successfully."
