function Get-Settings{
	[CmdletBinding()]
	param(
	)

	try
	{
		$settings = Get-Content -Path "$PSScriptRoot\settings.json" -ErrorAction SilentlyContinue | ConvertFrom-Json
		
		if($null -eq $settings){
			$settings = Get-Content -Path "settings.json" -ErrorAction Stop | ConvertFrom-Json
		}

		return $settings
	}
	catch
	{
		throw "settings.json file was not found."
	}
}
