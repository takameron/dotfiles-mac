#!/bin/sh

# link
basename -a "$PWD"/4_dotfiles/.??* | xargs -I{} ln -sfv "$PWD"/4_dotfiles/{} ~/{}

# Zinit (Zsh plugin manager)
sh -c "$(curl -fsSL https://git.io/zinit-install)"
echo ". $PWD/4_dotfiles/.plugins.zsh" >> ~/.zshrc

# Delete .DS_Store
echo "alias dsstore=\"find . -name '*.DS_Store' -type f -ls -delete\"" >> ~/.zshrc

echo "👍 dotfiles link is done!"
