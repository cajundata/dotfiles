# Improve System Workflow
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$(go env GOPATH)/bin"
alias update="brew update && brew upgrade"
alias ll="ls -la"
alias ..="cd .."
alias projects="cd ~/projects"
alias oob="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Weldon_OpsBrain"

# Dev Tool Shortcuts
alias claude="~/.local/bin/claude"
alias nvim="~/.local/bin/nvim-macos-x86_64/bin/nvim"
alias yolo="claude --dangerously-skip-permissions"
alias gs="git status"

# Home Network Navigation
alias legion="ssh -A legion-wsl"
alias dev="ssh -A brain-box"

# Shell niceties
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
#   export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# Prompt
eval "$(starship init zsh)"
