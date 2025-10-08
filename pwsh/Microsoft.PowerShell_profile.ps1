oh-my-posh init pwsh --config ~/.config/oh-my-posh/config.omp.json | Invoke-Expression
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:NVIMC="$HOME\.config\nvim"
$env:VCPKG_ROOT = "C:\path\to\vcpkg"
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"
New-Alias vim nvim 
New-Alias :wqa exit

function workspace([string]$path_start)
{
    $path_root = "D:\Projects\"
    if ($path_start.Length -ne 0)
    {
        $path_root = $path_root + $path_start
    }

    $path=(fd -t d '' $path_root | fzf)
    if ($path.Length -eq 0)
    {
        return 0
    }
    Set-Location $path

    wezterm cli spawn --cwd $path
    wezterm cli spawn --cwd $path
    vim
}

function goto([string]$path)
{
    $path_test = $path
    if ($path.Length -eq 0)
    {
        $path_test = $HOME
    }
    fd -t d '' $path_test | fzf | Set-Location
}

function ln ($target, $link)
{
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function new-tab()
{
    wezterm.exe cli spawn --cwd .
}
