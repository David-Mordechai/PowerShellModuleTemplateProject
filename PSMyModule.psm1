# if module executed not in development mode then path to reslove dependencies is
$path = (Split-Path -Parent $MyInvocation.MyCommand.Definition)

if(!(Test-Path -Path $path))
{
    # module executed in development mode then path to reslove dependencies is
    $path = '.'
}

# load all dependencies - ps1 scripts files
Resolve-Path $path\Settings\*.ps1 | ForEach-Object { . $_.ProviderPath } 
Resolve-Path $path\Functions\*.ps1 | ForEach-Object { . $_.ProviderPath } 