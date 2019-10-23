install_brew_apps() {
    brew install git
    brew install mas
}

install_cask_apps() {
    # renew_sudo # to make the Caskroom on first install
    brew cask install 1password
    brew cask install appcleaner
    brew cask install bettertouchtool
    brew cask install beyond-compare
    brew cask install carbon-copy-cloner
    brew cask install charles
    brew cask install citrix-workspace
    brew cask install cryptobridge
    brew cask install docker
    brew cask install dropbox
    brew cask install evernote
    brew cask install expressvpn
    brew cask install fantastical
    brew cask install filezilla
    brew cask install firefox
    brew cask install flixtools
    brew cask install flux
    brew cask install gimp
    brew cask install google-chrome
    brew cask install handbrake
    brew cask install iterm2
    brew cask install keyfinder
    brew cask install kap
    brew cask install mamp
    brew cask install mp4tools
    brew cask install musescore
    brew cask install postman
    brew cask install powerphotos
    brew cask install sketch
    brew cask install skype
    brew cask install slack
    brew cask install soundcleod
    brew cask install sourcetree
    brew cask install spectacle
    brew cask install spotify
    brew cask install spotify-notifications
    brew cask install stack
    brew cask install studio-3t
    brew cask install telegram
    brew cask install textexpander
    brew cask install transmission
    brew cask install tripmode
    brew cask install virtualbox
    brew cask install virtualbox-extension-pack
    brew cask install visual-studio-code
    brew cask install vlc
    brew cask install whatsapp
    brew cask install yarn
    brew cask install zeplin
    brew cask install zsh

    # fonts
    brew tap homebrew/cask-fonts
    brew cask install font-fira-code
    brew cask install font-menlo-for-powerline
}

function mas_login_applescript() {
    
    if [[ "$MAS_APPLE_ID" == "" ]]
    then
        echo ''
        MAS_APPLE_ID="    "
        read -r -p "please enter apple id to log into appstore: " MAS_APPLE_ID
        #echo $MAS_APPLE_ID
    else
        :
    fi
    
    if [[ "$MAS_APPSTORE_PASSWORD" == "" ]]
    then
        echo ''
        echo "please enter appstore password..."
        MAS_APPSTORE_PASSWORD="    "
    
        # ask for password twice
        #while [[ $MAS_APPSTORE_PASSWORD != $MAS_APPSTORE_PASSWORD2 ]] || [[ $MAS_APPSTORE_PASSWORD == "" ]]; do stty -echo && printf "appstore password: " && read -r "$@" MAS_APPSTORE_PASSWORD && printf "\n" && printf "re-enter appstore password: " && read -r "$@" MAS_APPSTORE_PASSWORD2 && stty echo && printf "\n" && USE_MAS_APPSTORE_PASSWORD='builtin printf '"$MAS_APPSTORE_PASSWORD\n"''; done
    
        # only ask for password once
        stty -echo && printf "appstore password: " && read -r "$@" MAS_APPSTORE_PASSWORD && printf "\n" && stty echo && USE_MAS_APPSTORE_PASSWORD='builtin printf '"$MAS_APPSTORE_PASSWORD\n"''
        echo ''
    else
        :
    fi
    
    mas signout
    sleep 3

	osascript <<EOF
    tell application "App Store"
        try
    	    activate
    	    delay 5
    	end try
    end tell
    tell application "System Events"
    	tell process "App Store"
    		set frontmost to true
    		delay 2
    		### on first run when installing the appstore asks for accepting privacy policy
    		try
			    click button 2 of UI element 1 of sheet 1 of window 1
			    #click button "Weiter" of UI element 1 of sheet 1 of window 1
			    delay 3
		    end try
		    ### login
    		click menu item 15 of menu "Store" of menu bar item "Store" of menu bar 1
    		#click menu item "Anmelden" of menu "Store" of menu bar item "Store" of menu bar 1
    		delay 2
    		tell application "System Events" to keystroke "$MAS_APPLE_ID"
    		delay 2
    		tell application "System Events" to keystroke return
    		delay 2
    		tell application "System Events" to keystroke "$MAS_APPSTORE_PASSWORD"
    		delay 2
    		tell application "System Events" to keystroke return
    	end tell
    end tell
    
    tell application "App Store"
        try
            delay 10
    	    quit
    	end try
    end tell
    
EOF

}


install_mas_apps() {
    readonly local mas_apps=('tweetbot2=557168941','tweetbot3=1384080005', 'xcode=497799835')

    mas signin "${mas_email}" "${mas_password}"
    #mas_login_applescript

    for app in "${mas_apps[@]}"; do
        local app_id="${app#*=}"
        mas install "${app_id}"
    done
}