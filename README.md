prerequesited on new mac:
Install brew:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install git:
brew install git

There is much more scripts in the bundle I am using. So making everythung work correctly, follow this steps:

Check out:
cd ~
mkdir x
cd x
git clone https://github.com/Nimetko/.dotfiles
cd .dotfiles
./init.sh


just run init.sh script.

When there are some errors with setting up nvim for  the first time.
Try to delete this foder: ~/.local/share/nvim
This will remove all packer stuff since we moved to lazy packer manager.

TODO: use ansible. Make it for linux subsystem as well.
