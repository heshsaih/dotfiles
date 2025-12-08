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

# checking if there are necessary tools installed
Get-Command wezterm
if (!$?)
{
    Write-Output "wezterm not available, exiting"
    Exit 0    
}

Get-Command scoop
if (!$?)
{
    Write-Output "scoop not installed, installing"
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    if (!$?)
    {
        Write-Output "failed to install scoop, exiting"
        Exit 0
    }
}
Get-Command fd
if (!$?)
{
    Write-Output "fd not installed, installing"
    scoop install fd
    if (!$?)
    {
        Write-Output "failed to install fd, exiting"
        Exit 0
    }
}
Get-Command fzf
if (!$?)
{
    Write-Output "fzf not installed, installing"
    scoop install fzf
    if (!$?)
    {
        Write-Output "failed to install fzf, exiting"
        Exit 0
    }
}

ln "$PWD\wezterm\.wezterm.lua" "$HOME\.wezterm_windows.lua"
ln "$PWD\pwsh\Microsoft.PowerShell_profile.ps1" "$PROFILE"
ln "$PWD\oh-my-posh\config.omp.json" "$HOME\.config\oh-my-posh\config.omp.json"
ln "$PWD\nvim" "$HOME\.config\nvim"
