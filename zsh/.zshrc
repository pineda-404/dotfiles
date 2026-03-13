# ============================================
# PATH Configuration
# ============================================
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# ============================================
# History Configuration
# ============================================
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt SHARE_HISTORY          # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don't record duplicates
setopt HIST_IGNORE_ALL_DUPS   # Delete old duplicate entry
setopt HIST_FIND_NO_DUPS      # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE      # Don't record entries starting with space
setopt HIST_SAVE_NO_DUPS      # Don't write duplicates to history file
setopt HIST_REDUCE_BLANKS     # Remove extra blanks from commands
setopt HIST_VERIFY            # Show command before executing from history
setopt INC_APPEND_HISTORY     # Add commands immediately (not at shell exit)

# ============================================
# Oh My Zsh Configuration
# ============================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""  # Disabled - using Starship

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ============================================
# General Options
# ============================================
setopt AUTO_CD              # cd by typing directory name
setopt CORRECT              # Spell correction for commands
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt NO_BEEP              # No beep on error

# ============================================
# Editor
# ============================================
export EDITOR='nvim'
export VISUAL='nvim'

# ============================================
# FZF and Zoxide
# ============================================
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"

# ============================================
# Aliases
# ============================================
alias y="yazi"
alias pdf="zathura"
alias v="nvim"


# ls improvements (if eza is installed)
if command -v eza &> /dev/null; then
    alias ls="eza --icons"
    alias ll="eza -la --icons"
    alias la="eza -a --icons"
    alias lt="eza --tree --level=2 --icons"
fi

# ============================================
# Functions
# ============================================
# Open man pages in Neovim
vman() {
    nvim -c "Man $*" -c "only"
}

# ============================================
# SDKMAN (must be at the end)
# ============================================
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# ============================================
# Starship Prompt (must be last)
# ============================================
eval "$(starship init zsh)"

# opencode
export PATH=/home/pineda/.opencode/bin:$PATH
