#!/bin/sh

export PATH=~/.ellipsis/bin:/usr/local/bin:$PATH

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Need to install first
brew install openssl
brew install readline

# Common tools/libraries
brew install ack
brew install apple-gcc42
brew install astyle
brew install bash
brew install bazaar
brew install boost
brew install cloc
brew install cowsay
brew install ctags
brew install curl
brew install dos2unix
brew install faac
brew install flac
brew install gcc
brew install gettext
brew install gist
brew install git
brew install gnupg
brew install gpm
brew install gpm-bootstrap
brew install gvp
brew install html2text
brew install hub
brew install ios-webkit-debug-proxy
brew install irssi
brew install jpeg
brew install lame
brew install libev
brew install libevent
brew install libffi
brew install libiconv
brew install libpng
brew install libxml2
brew install libxslt
brew install libyaml
brew install mercurial
brew install ncurses
brew install netcat
brew install node
brew install p7zip
brew install pianobar
brew install pngcrush
brew install protobuf
brew install pypy
brew install qt
brew install qt5
brew install repl
brew install rlwrap
brew install scons
brew install screenresolution
brew install snappy
brew install ssh-copy-id
brew install sshfs
brew install the_silver_searcher
brew install tmux
brew install tree
brew install unrar
brew install vimpager
brew install watch
brew install wget
brew install wrk
brew install xz
brew install zeromq
brew install zsh

# Languages
brew install cabal-install
brew install ghc
brew install go
brew install idris
brew install leiningen
brew install lua
brew install luajit
brew install luarocks
brew install pypy
brew install python
brew install python3
brew install ruby
brew install rust
brew install scala

# Vim
brew install macvim --override-system-vim --custom-icons --with-luajit --HEAD
brew install vim --with-luajit --HEAD
brew install neovim

# Databases
brew install postgresql
brew install mongodb
brew install redis
brew install sqlite
brew install leveldb

# Taps
brew tap homebrew/apache
brew install ab

brew tap mpv-player/mpv
brew install --HEAD mpv-player/mpv/libass-ct
brew install --HEAD ffmpeg
brew install mpv

# install wc3 version of tidy, which is a head only formula
brew install homebrew/dupes/tidy --HEAD

# links apps installed by homebrew
brew linkapps

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
pip install docutils
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

# Add zsh to list of shells
sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"

# Fix apple misconfiguration so Zsh has proper PATH
sudo mv /etc/zshenv /etc/zprofile

# Install osxfuse kext
sudo /bin/cp -RfX /usr/local/Library/Filesystems/osxfusefs.fs /Library/Filesystems/
sudo chmod +s /Library/Filesystems/osxfusefs.fs/Support/load_osxfusefs

# Set Hostname
sudo scutil --set ComputerName "qi"
sudo scutil --set HostName "qi"
sudo scutil --set LocalHostName "qi"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "qi"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Restart automatically if the computer freezes
systemsetup -setrestartfreeze on

# Never go into computer sleep mode
# systemsetup -setcomputersleep Off > /dev/null

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the
# login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Trackpad: swipe between pages with three fingers
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Allow installing user scripts via GitHub or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://*.github.com/*" "http://userscripts.org/*"

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before?
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Expanding the save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Displaying ASCII control characters using caret notation in standard text views
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# Setup dev lookups to use dnsmasq
# sudo mkdir -v /etc/resolver
# sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

# Save to disk, rather than iCloud, by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the sudden motion sensor (it's not useful for SSDs/current MacBooks)
sudo pmset -a sms 0

# Speed up wake from sleep to 24 hours from an hour
sudo pmset -a standbydelay 86400

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls (enable Tab in modal dialogs, menu windows, etc.
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# EnableHiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate
defaults write com.apple.dock tilesize -int 36

# Set Dock to auto-hide
defaults write com.apple.dock autohide -bool true

# Remove autohide delay
# defaults write com.apple.dock autohide-delay -float 0
# defaults write com.apple.dock autohide-time-modifier -float 0

# Privacy: Don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Adding a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Disable the annoying backswipe in Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Use the system-native print preview dialog in Chrome"
defaults write com.google.Chrome DisablePrintPreview -bool true
defaults write com.google.Chrome.canary DisablePrintPreview -bool true

# Disable automatic emoji substitution in Messages.app? (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes in Messages.app? (it's annoying for messages that contain code)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking in Messages.app?
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Install cask and binary applications
brew install caskroom/cask/brew-cask

brew cask install alfred
brew cask install atom
brew cask install firefox
brew cask install flash-player
brew cask install flux
brew cask install geekbench
brew cask install gfxcardstatus
brew cask install google-chrome
brew cask install hyperdock
brew cask install imageoptim
brew cask install iterm2
brew cask install karabiner
brew cask install mplayerx
brew cask install screenhero
brew cask install seil
brew cask install simple-comic
brew cask install skype
brew cask install steam
brew cask install transmission
brew cask install xbench
