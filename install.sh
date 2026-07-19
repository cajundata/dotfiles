#!/usr/bin/env bash
# Dotfiles installer for macOS and Linux.
# Idempotent: safe to re-run any time; existing non-link files are backed up
# to ~/.dotfiles-backup/<timestamp>/ before being replaced.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

case "$(uname -s)" in
  Darwin) OS=macos ;;
  Linux)  OS=linux ;;
  *) echo "Unsupported OS: $(uname -s). On Windows, run install.ps1 instead." >&2; exit 1 ;;
esac

link() {
  local src="$1" dst="$2"

  if [ ! -e "$src" ]; then
    echo "  skip  $dst (source $src missing)"
    return
  fi

  # Already correct
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "  ok    $dst"
    return
  fi

  # Back up anything else that's in the way (real file, dir, or stale link)
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dst" "$BACKUP_DIR/$(basename "$dst")"
    echo "  moved $dst -> $BACKUP_DIR/"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "  link  $dst -> $src"
}

hint() {
  local cmd="$1" mac_hint="$2" linux_hint="$3"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    if [ "$OS" = macos ]; then
      echo "  missing: $cmd ($mac_hint)"
    else
      echo "  missing: $cmd ($linux_hint)"
    fi
  fi
}

echo "Linking configs from $DOTFILES"
link "$DOTFILES/nvim"                    "$HOME/.config/nvim"
link "$DOTFILES/wezterm/wezterm.lua"     "$HOME/.wezterm.lua"
link "$DOTFILES/starship/starship.toml"  "$HOME/.config/starship.toml"
link "$DOTFILES/zsh/.zshrc"              "$HOME/.zshrc"
link "$DOTFILES/vscode/cajun-data-theme" "$HOME/.vscode/extensions/cajundata.cajun-data-theme-1.0.0"

echo "Checking tools"
hint nvim     "brew install neovim"            "apt/dnf install neovim"
hint starship "brew install starship"          "curl -sS https://starship.rs/install.sh | sh"
hint wezterm  "brew install --cask wezterm"    "see https://wezterm.org/install/linux.html"

# JetBrainsMono Nerd Font (used by wezterm.lua)
font_found=false
if [ "$OS" = macos ]; then
  ls "$HOME/Library/Fonts" /Library/Fonts 2>/dev/null | grep -qi 'JetBrainsMono.*Nerd' && font_found=true
elif command -v fc-list >/dev/null 2>&1; then
  fc-list 2>/dev/null | grep -qi 'JetBrainsMono Nerd' && font_found=true
fi
if [ "$font_found" = false ]; then
  if [ "$OS" = macos ]; then
    echo "  missing: JetBrainsMono Nerd Font (brew install --cask font-jetbrains-mono-nerd-font)"
  else
    echo "  missing: JetBrainsMono Nerd Font (https://www.nerdfonts.com/font-downloads)"
  fi
fi

if [ -d "$BACKUP_DIR" ]; then
  echo "Replaced files were backed up to $BACKUP_DIR"
fi
echo "Done. Reload VS Code and select the 'Cajun Data Dark' theme if not already active."
