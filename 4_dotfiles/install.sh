#!/bin/sh

# link
basename -a "$PWD"/4_dotfiles/.??* | xargs -I{} ln -sfv "$PWD"/4_dotfiles/{} ~/{}

# Zinit (Zsh plugin manager)
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
echo ". $PWD/4_dotfiles/.plugins.zsh" >> ~/.zshrc

# Delete .DS_Store
echo "alias dsstore=\"find . -name '*.DS_Store' -type f -ls -delete\"" >> ~/.zshrc

echo "👍 dotfiles link is done!"
