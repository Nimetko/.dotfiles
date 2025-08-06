#!/bin/bash

set -e

# Update system and install core tools
sudo dnf update -y
sudo dnf install -y \
  ansible \
  zsh \
  fzf \
  stow \
  tmux \
  neovim \
  ripgrep \
  lazygit \
  gh \
  git-lfs \
  bat \
  tldr \
  figlet \
  ranger \
  cmatrix \
  glow \
  curl \
  git

# Fonts (install Hack Nerd Font manually or via flatpak/fontconfig if needed)
echo " Note: Nerd Fonts must be manually installed or added via font manager."

# Install jp2a (might not be in official repos)
if ! command -v jp2a &> /dev/null; then
  echo " jp2a not found in dnf — building from source..."
  sudo dnf install -y gcc make wget
  wget https://github.com/cslarsen/jp2a/archive/refs/heads/master.zip
  unzip master.zip
  cd jp2a-master
  ./bootstrap && ./configure && make
  sudo make install
  cd ..
  rm -rf jp2a-master master.zip
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone your scripts
echo "Cloning personal scripts..."
mkdir -p ~/x
git clone https://github.com/Nimetko/macos-scripts ~/x/scripts || echo "Already cloned?"
echo "Script finished"
