#!/bin/sh

# link
basename -a "$PWD"/dotfiles/.??* | xargs -I{} ln -sfv "$PWD"/dotfiles/{} ~/{}

# Zinit (Zsh plugin manager)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/master/doc/install.sh)"
echo "source ~/.plugins.zsh" >> ~/.zshrc

# Delete .DS_Store
echo "alias dsstore=\"find . -name '*.DS_Store' -type f -ls -delete\"" >> ~/.zshrc

echo "👍 dotfiles link is done!"