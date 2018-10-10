install_brew_apps() {
    brew install git
}

install_cask_apps() {
    renew_sudo # to make the Caskroom on first install
    brew cask install 1password
    brew cask install appcleaner
    brew cask install carbon-copy-cloner
    brew cask install dropbox
    brew cask install evernote
    brew cask install fantastical
    brew cask install firefox
    brew cask install flixtools
    brew cask install google-chrome
    brew cask install iterm2
    brew cask install mp4tools
    brew cask install sketch
    brew cask install skype
    brew cask install slack
    brew cask install soundcleod
    brew cask install sourcetree
    brew cask install spotify
    brew cask install stack
    brew cask install transmission
    brew cask install tripmode
    brew cask install virtualbox
    brew cask install virtualbox-extension-pack
    brew cask install visual-studio-code
    brew cask install vlc
    brew cask install whatsapp
    brew cask install zeplin

    # fonts
    brew tap homebrew/cask-fonts
    brew cask install font-fira-code
    brew cask install font-menlo-for-powerline
}