<#
.SYNOPSIS
    This PowerShell script ensures that the audit policy using subcategories is enabled.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000030-Remediation.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Define the property name and value
$propertyName = "SCENoApplyLegacyAuditPolicy"
$propertyValue = 1

try {
    # Check if the registry path exists
    if (-not (Test-Path $registryPath)) {
        Write-Output "Registry path does not exist: $registryPath"
        exit 1
    }

    # Set the registry value
    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
    Write-Output "Registry value '$propertyName' set to '$propertyValue' successfully."
} catch {
    Write-Error "Failed to set registry value: $_"
    exit 1
}
