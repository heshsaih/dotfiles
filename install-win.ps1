# WARNING: this script will wipe the existing configuration for these tools, make sure to make a copy

function ln ($target, $link)
{
    New-Item -Force -Path $link -ItemType SymbolicLink -Value $target

    # if it fails to create the link, it'll try to remove the existing file and override it
    if (!$?)
    {
        Remove-Item -Force -Recurse $link
        New-Item -Force -Path $link -ItemType SymbolicLink -Value $target
    }
}

# script expects that you have the wezterm emulator installed
Get-Command wezterm
if (!$?)
{
    Write-Output "wezterm not available, exiting"
    Exit 0    
}

ln "$PWD\wezterm\.wezterm.lua" "$HOME\.wezterm.lua"
ln "$PWD\pwsh\Microsoft.PowerShell_profile.ps1" "$PROFILE"
ln "$PWD\oh-my-posh\config.omp.json" "$HOME\config.omp.json"
ln "$PWD\nvim" "$HOME\.config\nvim"
