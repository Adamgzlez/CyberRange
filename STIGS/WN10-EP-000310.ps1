<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
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
