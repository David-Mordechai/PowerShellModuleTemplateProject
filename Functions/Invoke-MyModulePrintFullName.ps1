function Invoke-MyModulePrintFullName {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]$FirstName,
        [Parameter(Mandatory)]
        [string]$LastName
    )
    
    try {
        Write-Host "Printing full name from settings.json: " -NoNewline
        Write-Host $FirstName, $LastName "🤔" -ForegroundColor Green 
    }
    catch {
        throw "Failed to print fullname."
    }
}