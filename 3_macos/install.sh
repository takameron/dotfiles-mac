#!/bin/sh

# --- Finder ---
# 隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles -bool true
# すべての拡張子のファイルを表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# ドライブをデスクトップに表示
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
killall Finder

# ネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBメモリに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# --- Security ---
# ファイアーウォールをオン
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# --- Dock ---
# “自動的に非表示”をオン
defaults write com.apple.dock autohide -bool true
# 最近使ったアプリケーションを非表示
defaults write com.apple.dock show-recents -bool false
killall Dock

# --- SystemUIServer関係 ---
# スクリーンショットのドロップシャドウを付けない
defaults write com.apple.screencapture disable-shadow -bool true
killall SystemUIServer

# ---　TextEdit　---
# リッチテキストから標準テキストに変更
defaults write com.apple.TextEdit RichText -int 0

echo "👍 MacOS setting is done!"