stow -D -t ~ nvim
stow -D -t ~ tmux
stow -D -t ~ zsh
stow -D -t ~ zsh_profile
stow -D -t ~ ranger
stow -D -t ~ hammerspoon
stow -D -t ~ vscode

# Remove legacy Hammerspoon symlink if it exists
if [ -L ~/Spoons ]; then
  rm ~/Spoons
fi

# Optional packages (uncomment if you stowed them)
# stow -D -t ~ gh
# stow -D -t ~ karabiner
# stow -D -t ~ mc
# stow -D -t ~ rmpc
# stow -D -t ~ doist
# stow -D -t ~ flutter
