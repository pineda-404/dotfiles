# Dotfiles

Personal configuration files for Linux.

## Quick Install

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## What's Included

| Config | Description |
|--------|-------------|
| `zsh/` | Zsh config with Oh My Zsh |
| `nvim/` | Neovim config with Lazy.nvim |
| `ghostty/` | Ghostty terminal emulator |
| `i3/` | i3 window manager |
| `polybar/` | Status bar |
| `picom/` | Compositor |
| `tmux/` | Terminal multiplexer |
| `btop/` | System monitor |
| `bat/` | Cat replacement with syntax highlighting |
| `git/` | Git configuration |

## Manual Steps

1. **Ghostty** - Install from [ghostty.org](https://ghostty.org)
2. **Fonts** - Install a Nerd Font for icons
3. **SDKMAN** - If needed: `curl -s "https://get.sdkman.io" | bash`

## Updating

```bash
cd ~/dotfiles
git pull
```
