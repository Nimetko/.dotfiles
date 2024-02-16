Set-Alias -Name update -Value '~\x\scripts\windows\UpdateRepositories.ps1'
Set-Alias -Name push -Value '~\x\scripts\windows\AutoPushRepos.ps1'
Set-Alias -Name status -Value '~\x\scripts\windows\StatusRepositories.ps1'
Set-Alias -Name lf -Value '~\x\scripts\windows\FuzzyFinderInDirectory.ps1'
Set-Alias -Name vim -Value nvim
Set-Alias -Name v -Value nvim

# time management
Set-Alias -Name alarm -Value '~\x\scripts\alarm.bat'
Set-Alias -Name focus -Value '~\x\scripts\focus.bat'

# shutdown pc
# Set-Alias -Name shutdown -Value {shutdown /s /f /t 0}

Set-Alias -Name cl -Value clear

function Start-Explorer { Start-Process explorer}
Set-Alias -Name desktop -Value Start-Explorer

function Stop-Explorer { Stop-Process -Name explorer }
Set-Alias -Name nodesktop -Value Stop-Explorer

#git
Set-Alias -Name g -Value git

function Git-CommitWithMessage {
    param(
        [string]$Message
    )
    git commit -m $Message
}
Set-Alias -Name gicm -Value Git-CommitWithMessage

function Git-Status {
    git status
}
Set-Alias -Name gis -Value Git-Status

function Git-Push {
    git push
}
Set-Alias -Name gip -Value Git-Push


function Git-AddAll {
    git add .
}
Set-Alias -Name giaa -Value Git-AddAll

function Git-Add {
    param(
        [string]$File
    )
    git add $File
}
Set-Alias -Name gia -Value Git-Add

