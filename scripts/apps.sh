install_brew_apps() {
    brew install git
    brew install mass
}

install_cask_apps() {
    # renew_sudo # to make the Caskroom on first install
    brew cask install 1password
    brew cask install appcleaner
    brew cask install bettertouchtool
    brew cask install beyond-compare
    brew cask install carbon-copy-cloner
    brew cask install charles
    brew cask install citrix-receiver
    brew cask install cryptobridge
    brew cask install docker
    brew cask install dropbox
    brew cask install duplicate-annihilator
    brew cask install evernote
    brew cask install expressvpn
    brew cask install fantastical
    brew cask install filezilla
    brew cask install firefox
    brew cask install flixtools
    brew cask install flux
    brew cask install google-chrome
    brew cask install handbrake
    brew cask install iterm2
    brew cask install keyfinder
    brew cask install kap
    brew cask install mamp
    brew cask install mp4tools
    brew cask install musescore
    brew cask install sketch
    brew cask install skype
    brew cask install slack
    brew cask install soundcleod
    brew cask install sourcetree
    brew cask install spotify
    brew cask install spotify-notifications
    brew cask install stack
    brew cask install studio-3t
    brew cask install telegram
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

install_mas_apps() {
    readonly local mas_apps=('tweetbot2=557168941','tweetbot3=1384080005', 'xcode=497799835')

    mas signin "${mas_email}" "${mas_password}"

    for app in "${mas_apps[@]}"; do
        local app_id="${app#*=}"
        mas install "${app_id}"
    done
}