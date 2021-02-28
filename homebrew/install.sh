#!/bin/sh

# brewコマンドがなければインストール
if ! (type brew > /dev/null 2>&1); then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 権限設定
sudo chown -R "$(whoami)":admin /usr/local/*
sudo chmod -R g+w /usr/local/*

# Brewfileを実行
cd "$PWD"/homebrew || exit
brew bundle
cd - || exit


# pinentry-mac
mkdir ~/.gnupg
echo "pinentry-program /usr/local/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent

# coreutils
{
  echo "export PATH=\"/usr/local/opt/coreutils/libexec/gnubin:$PATH\""
  echo "export MANPATH=\"/usr/local/opt/coreutils/libexec/gnuman:$MANPATH\""
} >> ~/.zshrc
source ~/.zshrc

# gnu-tar
{
  echo "export PATH=\"/usr/local/opt/gnu-tar/libexec/gnubin:$PATH\""
  echo "export MANPATH=\"/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH\""
} >> ~/.zshrc
source ~/.zshrc

# AVR Toolchainへパスを通す
sudo ln -sfv /Applications/Arduino.app/Contents/Java/hardware/tools/avr /usr/local/avr
{
  echo "export PATH=\"//usr/local/avr/bin:$PATH\"/"
} >> ~/.zshrc
source ~/.zshrc

echo "👍 Homebrew setting is done!"