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
    STIG-ID         : WN10-SO-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000025-Remediation.ps1 
#>

# Renaming the Guest Account

try {
    # Get the built-in Guest account (SID ending with -501)
    $guestAccount = Get-LocalUser | Where-Object { $_.SID -like "*-501" }

    if ($null -ne $guestAccount) {
        # Rename the Guest account to "RenamedLocaluser"
        Rename-LocalUser -Name $guestAccount.Name -NewName "RenamedLocaluser"
        Write-Output "Guest account renamed to 'RenamedLocaluser' successfully."
    } else {
        Write-Output "Guest account not found."
    }
} catch {
    Write-Error "Failed to rename Guest account: $_"
}
