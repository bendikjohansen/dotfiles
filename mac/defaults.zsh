###
# Configure dock
###
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float "10"
defaults write com.apple.dock "tilesize" -int "1"

# defaults delete com.apple.dock "autohide"
# defaults delete com.apple.dock "autohide-delay"
# defaults delete com.apple.dock "tilesize"

###
# Configure screen capture 
###
defaults write com.apple.screencapture "disable-shadow" -bool "true"
defaults write com.apple.screencapture "type" -string "jpg"
defaults write com.apple.screencapture "location" -string "~/Pictures/screenshots"

mkdir -p ~/Pictures/screenshots

# defaults delete com.apple.screencapture "disable-shadow"
# defaults delete com.apple.screencapture "type"
# defaults delete com.apple.screencapture "location"

###
# Finder
###
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true" && 

# defaults delete com.apple.finder "FXRemoveOldTrashItems"

###
# Restart services
###
killall SystemUIServer
killall Dock
killall Finder

