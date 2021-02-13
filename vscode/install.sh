#!/usr/bin/env bash

# codeコマンドがなければVSCodeをインストール
if ! (type code > /dev/null 2>&1); then
  sh homebrew/install.sh
  brew install --cask visual-studio-code
fi

# settings.jsonの設置
ln -sfv "$PWD"/vscode/settings.json ~/Library/Application\ Support/Code/User/

# プラグインのインストール
pkglist=(
  ms-ceintl.vscode-language-pack-ja # Japanese Language Pack for Visual Studio Code
  ms-vscode-remote.remote-ssh-edit # Remote - SSH: Editing Configuration Files
  ics.japanese-proofreading # テキスト校正くん
  gruntfuggly.todo-tree # Todo Tree
  james-yu.latex-workshop # LaTeX Workshop
  wakatime.vscode-wakatime # WakaTime
)

for i in "${pkglist[@]}"; do
  code --install-extension "$i"
done

echo "👍 VSCode setting is done!"