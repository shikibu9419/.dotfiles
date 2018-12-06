#!/bin/sh

## Crash Report
defaults write com.apple.CrashReporter UseUNC 1
defaults write com.apple.dock springboard-columns -int 10
## Finder
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
defaults write com.apple.finder PathBarRootAtHome -bool yes
## Quick Look
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder QLHidePanelOnDeactivate -bool true
## Tool Tip & Dialog
defaults write -g NSInitialToolTipDelay -integer 100
defaults write -g NSWindowResizeTime 0.01
## Dock
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock autohide-time-modifier -int 1
defaults write com.apple.dock mineffect suck
## Key repeat
defaults write -g InitialKeyRepeat -int 12
defaults write -g KeyRepeat -int 1
## Move to .Trash dialog
defaults write com.apple.finder WarnOnEmptyTrash -bool false
