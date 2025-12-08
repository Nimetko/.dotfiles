Quick setup (macOS)

- Prereqs: Homebrew and Git
  - Install Homebrew (if missing):
    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  - Install Git (if missing): `brew install git`

- Clone repo
  - `mkdir -p ~/x && cd ~/x`
  - `git clone https://github.com/Nimetko/.dotfiles`
  - `cd .dotfiles`

- Full setup (installs tools + stows configs)
  - `./init.sh`

- Just stow configs (no package installs)
  - Ensure GNU Stow is available (if not): `brew install stow`
  - Run stow only: `./scripts/initStow.sh`

Notes
- Neovim: if you hit plugin bootstrap issues, try `rm -rf ~/.local/share/nvim` and re-open nvim.
- Hammerspoon: configs are linked to `~/.hammerspoon`. If you previously used `~/Spoons`, the script migrates contents for you.
