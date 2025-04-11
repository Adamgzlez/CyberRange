<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# PowerShell Script to update SealSecureChannel to 1

# Check for Admin rights
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script! Please run as Administrator."
    exit
}

# Define the registry path and name
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
$valueName = "SealSecureChannel"
$valueData = 1

# Check if the path exists
if (-not (Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating path..."
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
try {
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord
    Write-Host "Successfully set $valueName to $valueData in $registryPath"
}
catch {
    Write-Error "Failed to set registry value: $_"
}

# Optional: Verify the change
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName
Write-Host "Current value of $valueName is $($currentValue.$valueName)"

