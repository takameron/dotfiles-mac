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
cd "$PWD"/1_homebrew || exit
brew bundle
cd - || exit


# pinentry-mac
mkdir ~/.gnupg
echo "pinentry-program /usr/local/bin/pinentry-mac" > ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent

s_path=""
s_manpath=""

# coreutils
s_path="/usr/local/opt/coreutils/libexec/gnubin:${s_path}"
s_manpath="/usr/local/opt/coreutils/libexec/gnuman:${s_manpath}"

# curl
s_path="/usr/local/opt/curl/bin:${s_path}"

# gnu-tar
s_path="/usr/local/opt/gnu-tar/libexec/gnubin:${s_path}"
s_manpath="/usr/local/opt/gnu-tar/libexec/gnuman:${s_manpath}"

#shellcheck disable=SC2016
echo "export PATH=\"${s_path}"'$PATH"' >> ~/.zshrc
#shellcheck disable=SC2016
echo "export MANPATH=\"${s_manpath}"'$MANPATH"' >> ~/.zshrc
#shellcheck disable=SC1090
. ~/.zshrc

echo "👍 Homebrew setting is done!"
