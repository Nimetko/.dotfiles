#!/bin/bash
stow -t ~ nvim 
stow -t ~ tmux
stow -t ~ zsh
stow -t ~ zsh_profile

# vscode
mkdir -p "dotfiles/vscode/Library/Application Support/Code/User"
stow -t ~ vscode


