<#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 Kernel (Direct Memory Access) DMA Protection is enabled.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-EP-000310

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-EP-000310-Remediation.ps1 
#>

# PowerShell script to set DeviceEnumerationPolicy in the registry

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Kernel DMA Protection"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry value
New-ItemProperty -Path $regPath -Name "DeviceEnumerationPolicy" -PropertyType DWord -Value 0 -Force

Write-Output "Registry key and value have been set successfully."
