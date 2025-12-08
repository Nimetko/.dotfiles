# auto hide Dock
defaults write com.apple.dock autohide -bool true && killall Dock

# auto hide top top menu bar
osascript -e 'tell application "System Events" to tell dock preferences to set autohide menu bar to true'

# Set KeyRepeating
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

# Not able to remap capslock -> ctrl in an easy transparent way. Do it manually please

# remove hold key -> show other key options. Needed in VSCode for moveing with hjkl, holding.
defaults write -g ApplePressAndHoldEnabled -bool false

# remove tiled windows (from desktop & Dock -> Tiled windows  have margin -> fase)
defaults write com.apple.WindowManager EnableTiledWindowMargins -bool false

