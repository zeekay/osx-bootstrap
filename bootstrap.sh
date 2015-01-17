#!/bin/sh

export PATH=~/.ellipsis/bin:/usr/local/bin:$PATH

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Use homebrew to install a few necessities
brew install openssl
brew install readline
brew install python
brew install python3
brew install lua
brew install luajit

# needed later
pip install docutils

# macvim preferences
brew install macvim --override-system-vim --custom-icons --with-luajit --HEAD

brew install ack
brew install astyle
brew install cabal-install
brew install cloc
brew install cowsay
brew install ctags
brew install dos2unix
brew install ghc
brew install gist
brew install git
brew install gpm
brew install gvp
brew install html2text
brew install hub
brew install lame
brew install leiningen
brew install libevent
brew install libev
brew install mercurial
brew install netcat
brew install node
brew install pianobar
brew install pypy
brew install repl
brew install rlwrap
brew install ruby
brew install ssh-copy-id
brew install sshfs
brew install tmux
brew install tree
brew install unrar
brew install vimpager
brew install watch
brew install wget
brew install zeromq
brew install zsh

brew tap mpv-player/mpv
brew install --HEAD mpv-player/mpv/libass-ct
brew install mpv

# install wc3 version of tidy, which is a head only formula
brew install homebrew/dupes/tidy --HEAD

# links apps installed by homebrew
brew linkapps

# Add zsh to list of shells
sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"

# Install osxfuse kext
sudo /bin/cp -RfX /usr/local/Library/Filesystems/osxfusefs.fs /Library/Filesystems/
sudo chmod +s /Library/Filesystems/osxfusefs.fs/Support/load_osxfusefs

# Install node.js utilities
npm install -g coffee-script
npm install -g coffeelint
npm install -g csslint
npm install -g html2jade
npm install -g js2coffee
npm install -g jshint
npm install -g jsontool

# Ruby gems
gem install CoffeeTags

# Python packages
pip install flake8
pip install httpie
pip install ipython
pip install pylint
pip install virtualenv

# Haskell
cabal update
cabal install ghc-mod

# Dotfiles
curl -L ellipsis.sh | sh
ellipsis install zeekay/files zeekay/vim zeekay/zsh zeekay/alfred zeekay/iterm2

# install old ruby 1.8.7
brew install rbenv ruby-build
eval "$(rbenv init -)"
rbenv install 1.8.7-p375
