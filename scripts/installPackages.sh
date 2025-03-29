#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ansible
brew install zsh
brew install fzf
brew install stow
brew install tmux
brew install nvim
brew install ripgrep
brew install lazygit

# nice to have
brew install tldr
brew install jp2a

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# clone the scripts
mkdir ~/x
git clone https://github.com/Nimetko/macos-scripts ~/x/scripts

# nice to have
brew install ranger
brew install glow

