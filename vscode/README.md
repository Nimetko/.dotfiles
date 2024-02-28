On Windows, create powershell symbolic links:

New-Item -ItemType SymbolicLink -Path "~\x\AppData\Roaming\Code\User\settings.json" -Target "~\x\.dotfiles\vscode\settings.json"
New-Item -ItemType SymbolicLink -Path "~\x\AppData\Roaming\Code\User\keybindings.json" -Target "~\x\.dotfiles\vscode\keybindings.json"


