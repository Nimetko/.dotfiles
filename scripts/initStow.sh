#!/bin/bash
set -e

# Backup any existing dotfiles in HOME and key config folders before adopting
backup_and_remove() {
    target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$target.backup_$(date +%s)"
        echo "Backed up $target"
    fi
}

# Backup main dotfiles
for file in ~/.zshrc ~/.zshrc_profile ~/.tmux.conf; do
    backup_and_remove "$file"
done

# Backup VSCode settings.json
backup_and_remove ~/Library/"Application Support"/Code/User/settings.json

# Backup nvim config dir (recursively)
if [ -d ~/.config/nvim ]; then
    timestamp=$(date +%s)
    mv ~/.config/nvim ~/.config/nvim.backup_$timestamp
    echo "Backed up ~/.config/nvim to ~/.config/nvim.backup_$timestamp"
fi

# Now use --adopt so stow will take over any remaining existing files
stow --adopt -t ~ nvim 
stow --adopt -t ~ tmux
stow --adopt -t ~ zsh
stow --adopt -t ~ zsh_profile

# VSCode (ensure dir exists first)
mkdir -p "dotfiles/vscode/Library/Application Support/Code/User"
stow --adopt -t ~ vscode
