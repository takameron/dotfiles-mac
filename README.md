Dotfiles for Mac
====

thanks https://github.com/zzzmisa/dotfiles-mac/

## 実行されること
* homebrewを用いてパッケージのインストール
* macOSの設定
* Git・Vim・VS Code・Zshの設定

## 動作確認環境
* macOS Catalina 10.15.7

## 事前準備
1. App Storeにサインイン
2. `xcode-select --install`コマンドを実行し、Command line tools for Xcodeをインストール
3. このリポジトリをclone

## 使い方
1. `dotfiles-mac`ディレクトリに移動
    ```
    cd dotfiles-mac
    ```

2. ディレクトリ直下の`install.sh`を実行すると、下層ディレクトリの`install.sh`が実行される
    ```
    sh install.sh
    ```

Gitのユーザー名はハードコーディングされているので、必要に応じて変更してください。

## License
These codes are licensed under CC0.

[![CC0](https://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](https://creativecommons.org/publicdomain/zero/1.0/deed.ja)