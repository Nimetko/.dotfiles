On Windows, create powershell symbolic links:

New-Item -ItemType SymbolicLink -Path "~\x\AppData\Roaming\Code\User\settings.json" -Target "~\x\.dotfiles\vscode\settings.json"
New-Item -ItemType SymbolicLink -Path "~\x\AppData\Roaming\Code\User\keybindings.json" -Target "~\x\.dotfiles\vscode\keybindings.json"


On Mac, create symbolic links:
ln -s ~/x/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/x/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
