#!/bin/bash
#
# Set up OSX preferences
#
# Inspired by: https://github.com/mathiasbynens/dotfiles/blob/master/.osx
###########################################
# CONFIG

HOSTNAME="shaula"

###########################################
# MAIN

echo "This script will set properties on OSX"
echo " Set computer name to $HOSTNAME (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName $HOSTNAME
sudo scutil --set HostName $HOSTNAME
sudo scutil --set LocalHostName $HOSTNAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $HOSTNAME

echo " Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo " Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

echo " Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo " Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo " Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: icnv, clmv, Flwv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo " Enable SSH "
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist

defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
defaults write com.apple.dock orientation -string right
killall Dock

#HomeBrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew tap homebrew/cask
brew install nmap
brew install wget
brew install pstree
brew install htop

brew cask install iterm2

brew install --cask google-chrome
brew install --cask firefox
brew install --cask slack
brew install --cask 1password
brew install --cask istat-menus
brew install --cask intel-power-gadget
brew install --cask sourcetree
brew install --cask sublime-text
brew install --cask jetbrains-toolbox
brew install --cask viscosity
brew install --cask postman
brew install --cask keka
brew install --cask little-snitch
brew install --cask whatsapp
brew install --cask telegram
brew install --cask google-cloud-sdk
 
brew install --cask qlcolorcode 
brew install --cask qlstephen 
brew install --cask qlmarkdown 
brew install --cask quicklook-json 
brew install --cask qlprettypatch 
brew install --cask quicklook-csv 
brew install --cask suspicious-package


brew install mas
# Amphetamine
mas install 937984704
# Magnet
mas install 441258766

echo "Done.  Restart computer to see all changes"

# https://github.com/alexramirez/mac-setup

###########################################
# brew install --cask flycut
# brew install --cask macdown
# brew install --cask docker
# brew install --cask corretto8
# brew install --cask corretto11
