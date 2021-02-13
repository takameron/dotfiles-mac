#!/bin/sh

# asdfコマンドがなければasdfをインストール
if ! (type asdf > /dev/null 2>&1); then
  sh homebrew/install.sh
  brew install coreutils curl git
  brew install asdf
fi

# add to shell
echo ". $(brew --prefix asdf)/asdf.sh" >> ~/.zshrc

# Default Packages
basename -a "$PWD"/asdf/.default-* | xargs -I{} ln -sfv "$PWD"/asdf/{} ~/{}

# === asdf-nodejs ===
# Requirements
brew install coreutils gpg gawk
# Install plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# Import the Node.js release team's OpenPGP keys to main keyring
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
# Install Node.js
asdf install nodejs latest
asdf global nodejs "$(asdf list nodejs | tail -1)"

# === asdf-python ===
# Install plugin
asdf plugin-add python https://github.com/danhper/asdf-python
# Install Python
asdf install python latest
asdf global python "$(asdf list python | tail -1)"

# === asdf-ruby ===
# Requirements(optional, but recommended)
brew install openssl readline
echo "export RUBY_CONFIGURE_OPTS=\"--with-openssl-dir=\"$(brew --prefix openssl@1.1)\"\"" >> ~/.zshrc
# Install plugin
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
# Install Ruby
asdf install ruby latest
asdf global ruby "$(asdf list ruby | tail -1)"

echo "👍 asdf install is done!"