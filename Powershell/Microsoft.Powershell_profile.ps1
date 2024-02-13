Set-Alias -Name update -Value '~\x\scripts\windows\UpdateRepositories.ps1'
Set-Alias -Name push -Value '~\x\scripts\windows\AutoPushRepos.ps1'
Set-Alias -Name status -Value '~\x\scripts\windows\StatusRepositories.ps1'
Set-Alias -Name lf -Value '~\x\scripts\windows\FuzzyFinderInDirectory.ps1'
Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value nvim

# time management
Set-Alias -Name alarm -Value '~\x\scripts\alarm.bat'

Set-Alias -Name cl -Value clear

function Start-Explorer { Start-Process explorer}
Set-Alias -Name desktop -Value Start-Explorer

function Stop-Explorer { Stop-Process -Name explorer }
Set-Alias -Name nodesktop -Value Stop-Explorer


