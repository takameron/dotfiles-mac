#!/usr/bin/env zsh

zinit ice wait'!0'; zinit light zsh-users/zsh-autosuggestions # 履歴補完
zinit ice wait'!0'; zinit light zdharma/fast-syntax-highlighting # シンタックスハイライト
zinit ice wait'!0'; zinit light zdharma/history-search-multi-word # Ctrl-Rでコマンド履歴を検索

zinit ice wait'!0'; zinit light zsh-users/zsh-completions # 補完（多数のコマンドに対応）
zinit ice wait'!0'; zinit light paulirish/git-open # GitHubで開く($git open)

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
