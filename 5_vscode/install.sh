#!/usr/bin/env bash

# codeコマンドがなければVSCodeをインストール
if ! (type code > /dev/null 2>&1); then
  if ! (type brew > /dev/null 2>&1); then
    sh homebrew/install.sh
  fi
  brew install --cask visual-studio-code
fi

# settings.jsonの設置
ln -sfv "$PWD"/5_vscode/settings.json ~/Library/Application\ Support/Code/User/

# プラグインのインストール
pkglist=(
  ms-ceintl.vscode-language-pack-ja # Japanese Language Pack for Visual Studio Code
  ms-vscode-remote.remote-ssh-edit # Remote - SSH: Editing Configuration Files
  gruntfuggly.todo-tree # Todo Tree
  wakatime.vscode-wakatime # WakaTime
  editorconfig.editorconfig # EditorConfig for VS Code
  ms-vscode.cpptools # C/C++
)

for i in "${pkglist[@]}"; do
  code --install-extension "$i"
done

echo "👍 VSCode setting is done!"
