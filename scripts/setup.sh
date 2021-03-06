 # helper function for bold text
bold_echo() {
    echo "$(tput bold)${1}$(tput sgr0)"
}

 # helper function for when the following command needs `sudo` active but shouldn't be called with it
#renew_sudo() {
 #   sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null
#}

initial_setup() {
    export PATH="/usr/local/bin:${PATH}"

    trap 'exit 0' SIGINT # exit cleanly if aborted with ⌃C
    caffeinate & # prevent computer from going to sleep
}

ask_details() {
    # ask for the administrator password upfront, for commands that require `sudo`
    # clear
    # sudo_askpass_set

    clear
        bold_echo 'Your Mac App Store details to install apps:'
        read -p 'MAS ID: ' MAS_APPLE_ID
        read -p 'MAS password: ' MAS_APPSTORE_PASSWORD

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

update_system() {
    softwareupdate --install --all
}
