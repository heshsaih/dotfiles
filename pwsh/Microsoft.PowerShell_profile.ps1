oh-my-posh init pwsh --config ~/.config/oh-my-posh/config.omp.json | Invoke-Expression
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:NVIMC="$HOME\.config\nvim"
$env:PROJECTS="D:\Projects"
$env:VCPKG_ROOT = "C:\path\to\vcpkg"
$env:PATH = "$env:VCPKG_ROOT;$env:PATH"
New-Alias vim nvim 

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
        $path_test = "$HOME/personal/projects"
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

function count-lines()
{
    $skipExts   = '.exe','.dll','.zip','.png','.jpg','.gif', '.json', '.sum', '.mod'   # file extensions to skip
    $skipDirs   = 'node_modules','.git','dist','build'        # directory names to skip

    Get-ChildItem -Recurse -File -Force |
        Where-Object {
            # 1. not hidden
            -not $_.Attributes.HasFlag([System.IO.FileAttributes]::Hidden)        -and
            # 2. extension not on the block-list
            $_.Extension -notin $skipExts                                         -and
            # 3. no part of the full directory path matches a skipped folder name
            ($_.DirectoryName -split [regex]::Escape([IO.Path]::DirectorySeparatorChar) |
                Where-Object { $_ -in $skipDirs }).Count -eq 0
            } |
            ForEach-Object {
                (Get-Content $_.FullName -ErrorAction SilentlyContinue |
                    Measure-Object -Line).Lines
                } |
                Measure-Object -Sum |
                ForEach-Object { $_.Sum }
}
