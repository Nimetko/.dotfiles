#!/bin/bash
set -e

backup_and_remove() {
    target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$target.backup_$(date +%s)"
        echo "Backed up $target"
    fi
}

# List your top-level dotfiles here
for file in ~/.zshrc ~/.zshrc_profile ~/.tmux.conf; do
    backup_and_remove "$file"
done

# VSCode (back up settings.json as example)
backup_and_remove ~/Library/"Application Support"/Code/User/settings.json

# nvim config
backup_and_remove ~/.config/nvim/nvim

# Now run stow
stow -t ~ nvim 
stow -t ~ tmux
stow -t ~ zsh
stow -t ~ zsh_profile

# vscode
mkdir -p "dotfiles/vscode/Library/Application Support/Code/User"
stow -t ~ vscode
