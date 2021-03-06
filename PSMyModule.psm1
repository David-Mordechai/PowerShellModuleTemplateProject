# if module executed not in development mode then path to reslove dependencies is
$path = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if(!(Test-Path -Path $path))
{
    # module executed in development mode then path to reslove dependencies is
    $path = '.'
}

# load all dependencies - ps1 scripts files
Resolve-Path $path\*\*.ps1 | ForEach-Object { . $_.ProviderPath } 
# Resolve-Path $path\Functions\*.ps1 | ForEach-Object { . $_.ProviderPath } 

function Get-MyModuleFullName {
    [CmdletBinding()]
    param (
        #OptionalParameters
    )
    
    # load settings from settings.json
    $settings = Get-Settings -ErrorAction Stop

    # example one for calling function with parameters
    # Invoke-MyModulePrintFullName -FirstName $settings.FirstName -LastName $settings.LastName -ErrorAction Stop

    # example two for calling function with parameters
    $params = @{
        FirstName = $settings.FirstName
        LastName = $settings.LastName
    }
    Invoke-MyModulePrintFullName @params -ErrorAction Stop
}