 # helper function for bold text
bold_echo() {
    echo "$(tput bold)${1}$(tput sgr0)"
}

 # helper function for when the following command needs `sudo` active but shouldn't be called with it
renew_sudo() {
    sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null
}

initial_setup() {
    export PATH="/usr/local/bin:${PATH}"

    trap 'exit 0' SIGINT # exit cleanly if aborted with ⌃C
    caffeinate & # prevent computer from going to sleep
}

ask_details() {
    # ask for the administrator password upfront, for commands that require `sudo`
    clear
    bold_echo 'Insert the "sudo" password now (will not be echoed).'
    until sudo --non-interactive true 2> /dev/null; do # if password is wrong, keep asking
        read -s -p 'Password: ' sudo_password
        echo
        sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null
    done

    clear
        bold_echo 'Your Mac App Store details to install apps:'
        read -p 'MAS email: ' mas_email
        read -s -p 'MAS password (will not be echoed): ' mas_password

    clear
        bold_echo 'Some details to be used when configuring git:'
        read -p 'First and last names: ' name
        read -p 'Github username: ' github_username
        read -p 'Github email: ' github_email

    clear
        bold_echo 'Some contact information to be set in the lock screen:'
        read -p 'Email address: ' email
        read -p 'Telephone number: ' telephone
        sudo --stdin defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Email: ${email}\nTel: ${telephone}" <<< "${sudo_password}" 2> /dev/null

    clear
}

sync_icloud() {
    bold_echo 'Press the download icons to download everything.'
    read -n0 -p '↵ to continue.'
    open "${HOME}/Library/Mobile Documents/com~apple~CloudDocs"
}

update_system() {
    softwareupdate --install --all
}
