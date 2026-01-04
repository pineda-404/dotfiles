#!/bin/bash

# ============================================
# Dotfiles Installation Script
# ============================================

set -e

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[OK]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[WARN]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# ============================================
# 1. Install packages
# ============================================
install_packages() {
    print_status "Installing packages..."
    
    # Detect package manager
    if command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
        INSTALL_CMD="sudo apt update && sudo apt install -y"
    elif command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
        INSTALL_CMD="sudo dnf install -y"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
        INSTALL_CMD="sudo pacman -S --noconfirm"
    else
        print_error "Package manager not supported"
        exit 1
    fi
    
    print_status "Detected package manager: $PKG_MANAGER"
    
    # Core packages (adjust names per distro)
    PACKAGES=(
        zsh
        neovim
        tmux
        btop
        i3
        polybar
        picom
        bat          # batcat on Debian/Ubuntu
        fzf
        ripgrep
        zoxide
        git
        curl
        wget
        unzip
    )
    
    # Install each package
    for pkg in "${PACKAGES[@]}"; do
        print_status "Installing $pkg..."
        eval "$INSTALL_CMD $pkg" 2>/dev/null || print_warning "Failed to install $pkg (may need manual install)"
    done
    
    print_success "Packages installed"
}

# ============================================
# 2. Install Oh My Zsh
# ============================================
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_status "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_success "Oh My Zsh installed"
    else
        print_warning "Oh My Zsh already installed"
    fi
}

# ============================================
# 3. Install Zsh plugins
# ============================================
install_zsh_plugins() {
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    
    # zsh-autosuggestions
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        print_status "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi
    
    # zsh-syntax-highlighting
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        print_status "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi
    
    print_success "Zsh plugins installed"
}

# ============================================
# 4. Install Ghostty (manual - not in repos)
# ============================================
install_ghostty() {
    if ! command -v ghostty &> /dev/null; then
        print_warning "Ghostty not found. Install manually from: https://ghostty.org"
    else
        print_success "Ghostty already installed"
    fi
}

# ============================================
# 5. Create symlinks
# ============================================
create_symlinks() {
    print_status "Creating symlinks..."
    
    mkdir -p "$CONFIG_DIR"
    
    # Function to safely create symlink
    link_config() {
        local src="$1"
        local dest="$2"
        
        if [ -e "$dest" ] || [ -L "$dest" ]; then
            print_warning "Backing up existing: $dest -> ${dest}.backup"
            mv "$dest" "${dest}.backup"
        fi
        
        ln -s "$src" "$dest"
        print_success "Linked: $dest -> $src"
    }
    
    # Zsh
    link_config "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    
    # Configs that go in ~/.config/
    link_config "$DOTFILES_DIR/nvim" "$CONFIG_DIR/nvim"
    link_config "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"
    link_config "$DOTFILES_DIR/bat" "$CONFIG_DIR/bat"
    link_config "$DOTFILES_DIR/i3" "$CONFIG_DIR/i3"
    link_config "$DOTFILES_DIR/polybar" "$CONFIG_DIR/polybar"
    link_config "$DOTFILES_DIR/picom" "$CONFIG_DIR/picom"
    link_config "$DOTFILES_DIR/tmux" "$CONFIG_DIR/tmux"
    link_config "$DOTFILES_DIR/btop" "$CONFIG_DIR/btop"
    
    # Git config (goes in home)
    if [ -f "$DOTFILES_DIR/git/.gitconfig" ]; then
        link_config "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
    fi
    
    print_success "All symlinks created"
}

# ============================================
# 6. Set Zsh as default shell
# ============================================
set_default_shell() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        print_status "Setting Zsh as default shell..."
        chsh -s "$(which zsh)"
        print_success "Zsh set as default shell (restart terminal to apply)"
    else
        print_success "Zsh is already the default shell"
    fi
}

# ============================================
# Main
# ============================================
main() {
    echo ""
    echo "╔════════════════════════════════════════╗"
    echo "║       Dotfiles Installation Script     ║"
    echo "╚════════════════════════════════════════╝"
    echo ""
    
    # Check if dotfiles dir exists
    if [ ! -d "$DOTFILES_DIR" ]; then
        print_error "Dotfiles directory not found at $DOTFILES_DIR"
        exit 1
    fi
    
    install_packages
    install_oh_my_zsh
    install_zsh_plugins
    install_ghostty
    create_symlinks
    set_default_shell
    
    echo ""
    print_success "Installation complete! 🎉"
    echo ""
    echo "Next steps:"
    echo "  1. Restart your terminal"
    echo "  2. Run 'nvim' and let Lazy.nvim install plugins"
    echo "  3. Install Ghostty manually if needed"
    echo ""
}

# Run with confirmation
echo "This will install packages and create symlinks."
echo "Existing configs will be backed up with .backup extension."
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    main
else
    echo "Aborted."
fi
