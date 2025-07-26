#!/bin/bash
set -e

# Backup and remove function for files or directories
backup_and_remove() {
    target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$target.backup_$(date +%s)"
        echo "Backed up $target"
    fi
}

# Backup top-level dotfiles from $HOME
for file in ~/.zshrc ~/.zshrc_profile ~/.tmux.conf; do
    backup_and_remove "$file"
done

# Backup VSCode user files from $HOME (not from the dotfiles repo)
backup_and_remove ~/Library/"Application Support"/Code/User/settings.json
backup_and_remove ~/Library/"Application Support"/Code/User/keybindings.json

# Backup nvim config dir from $HOME (not from the dotfiles repo)
if [ -d ~/.config/nvim ]; then
    backup_and_remove ~/.config/nvim
fi

# Now use stow from the repo root (this puts .config/nvim into your home .config/nvim)
cd "$(dirname "$0")/.."  # Go to repo root from scripts/
# Or manually: cd ~/x/.dotfiles

# Stow nvim configs, using your .config layout
stow --adopt -t ~ nvim

# Stow other configs into $HOME
stow --adopt -t ~ tmux
stow --adopt -t ~ zsh
stow --adopt -t ~ zsh_profile
stow --adopt -t ~ ideavim
stow --adopt -t ~ yazi
stow --adopt -t ~ mpd
stow --adopt -t ~ rmpc

# VSCode (ensure directory exists, then stow into $HOME)
mkdir -p ~/Library/"Application Support"/Code/User
stow --adopt -t ~ vscode

echo "All done!"

