$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:NVIMC="$HOME\.config\nvim"
$env:PROJECTS="D:\Projects"
$env:VCPKG_ROOT = "C:\path\to\vcpkg"
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"
New-Alias vim nvim 

$prompt = ""
function Invoke-Starship-PreCommand {
    $current_location = $executionContext.SessionState.Path.CurrentLocation
    if ($current_location.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $current_location.ProviderPath -replace "\\", "/"
        $prompt = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}$ansi_escape\"
    }
    $host.ui.Write($prompt)
}

Invoke-Expression (&starship init powershell)
