#!/usr/bin/env zsh

zinit ice wait'!0'; zinit light zsh-users/zsh-autosuggestions # 履歴補完
zinit ice wait'!0'; zinit light zdharma-continuum/fast-syntax-highlighting # シンタックスハイライト
zinit ice wait'!0'; zinit light zdharma-continuum/history-search-multi-word # Ctrl-Rでコマンド履歴を検索

zinit ice wait'!0'; zinit light paulirish/git-open # GitHubで開く($git open)
zinit ice wait'!0'; zinit light zsh-users/zsh-completions # 補完（多数のコマンドに対応）
autoload -Uz compinit && compinit
## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
