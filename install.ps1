# Dotfiles installer for Windows (PowerShell 7+ recommended: pwsh -File install.ps1)
# Idempotent: safe to re-run; existing non-link files are backed up to
# ~\.dotfiles-backup\<timestamp>\ before being replaced.
#
# Symlink creation on Windows requires either Developer Mode (Settings >
# System > For developers) or an elevated shell. For directories, the script
# falls back to a junction, which needs neither.

$ErrorActionPreference = 'Stop'

$Dotfiles = $PSScriptRoot
$BackupDir = Join-Path $HOME (".dotfiles-backup\" + (Get-Date -Format 'yyyyMMdd-HHmmss'))

function Install-Link {
    param([string]$Src, [string]$Dst)

    if (-not (Test-Path $Src)) {
        Write-Host "  skip  $Dst (source $Src missing)"
        return
    }

    $existing = Get-Item $Dst -ErrorAction SilentlyContinue
    if ($existing -and $existing.LinkType -and $existing.Target -eq $Src) {
        Write-Host "  ok    $Dst"
        return
    }

    if (Test-Path $Dst) {
        New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null
        Move-Item $Dst (Join-Path $BackupDir (Split-Path $Dst -Leaf))
        Write-Host "  moved $Dst -> $BackupDir\"
    }

    $parent = Split-Path $Dst -Parent
    New-Item -ItemType Directory -Force -Path $parent | Out-Null

    try {
        New-Item -ItemType SymbolicLink -Path $Dst -Target $Src | Out-Null
        Write-Host "  link  $Dst -> $Src"
    } catch {
        if (Test-Path $Src -PathType Container) {
            # Junctions work without Developer Mode or elevation
            New-Item -ItemType Junction -Path $Dst -Target $Src | Out-Null
            Write-Host "  junct $Dst -> $Src"
        } else {
            Copy-Item $Src $Dst
            Write-Warning "Symlink failed for $Dst; copied instead. Enable Developer Mode and re-run to get a live link."
        }
    }
}

function Test-Tool {
    param([string]$Cmd, [string]$Hint)
    if (-not (Get-Command $Cmd -ErrorAction SilentlyContinue)) {
        Write-Host "  missing: $Cmd ($Hint)"
    }
}

Write-Host "Linking configs from $Dotfiles"
Install-Link (Join-Path $Dotfiles 'nvim')                    (Join-Path $env:LOCALAPPDATA 'nvim')
Install-Link (Join-Path $Dotfiles 'wezterm\wezterm.lua')     (Join-Path $HOME '.wezterm.lua')
Install-Link (Join-Path $Dotfiles 'starship\starship.toml')  (Join-Path $HOME '.config\starship.toml')
Install-Link (Join-Path $Dotfiles 'vscode\cajun-data-theme') (Join-Path $HOME '.vscode\extensions\cajundata.cajun-data-theme-1.0.0')
# zsh config is intentionally skipped on Windows

Write-Host "Checking tools"
Test-Tool nvim     'winget install Neovim.Neovim'
Test-Tool starship 'winget install Starship.Starship'
Test-Tool wezterm  'winget install wez.wezterm'

$fonts = Get-ChildItem "$env:WINDIR\Fonts", "$env:LOCALAPPDATA\Microsoft\Windows\Fonts" -ErrorAction SilentlyContinue |
    Where-Object Name -match 'JetBrainsMono.*Nerd'
if (-not $fonts) {
    Write-Host "  missing: JetBrainsMono Nerd Font (winget install DEVCOM.JetBrainsMonoNerdFont)"
}

if (Test-Path $BackupDir) {
    Write-Host "Replaced files were backed up to $BackupDir"
}
Write-Host "Done. Reload VS Code and select the 'Cajun Data Dark' theme if not already active."
