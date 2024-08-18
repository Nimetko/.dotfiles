# Remove ~/.zshrc if it exists
if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
fi

# Create symbolic link for ~/.zshrc
ln -sf ~/x/.dotfiles/.zshrc ~/.zshrc

# Remove ~/.zshrc_profile if it exists
if [ -f ~/.zshrc_profile ]; then
    rm ~/.zshrc_profile
fi

# Create symbolic link for ~/.zshrc_profile
ln -sf ~/x/.dotfiles/.zshrc_profile ~/.zshrc_profile

# Remove ~/.tmux.conf if it exists
if [ -f ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi

# Create symbolic link for ~/.tmux.conf
ln -sf ~/x/.dotfiles/.tmux.conf ~/.tmux.conf

# Remove ~/.config/nvim/nvim if it exists
if [ -d ~/.config/nvim/nvim ]; then
    rm -rf ~/.config/nvim/nvim
fi

# Create symbolic link for ~/.config/nvim/nvim
ln -sf ~/x/.dotfiles/nvim ~/.config/nvim/nvim

