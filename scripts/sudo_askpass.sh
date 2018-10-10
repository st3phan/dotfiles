#!/bin/bash

sudo_askpass_set() {


   until sudo --non-interactive true 2> /dev/null; do # if password is wrong, keep asking
        read -s -t 30 - p "Enter your sudo password: " pw
        echo
        sudo --stdin --validate <<< "${pw}" 2> /dev/null
    done
    
    /usr/bin/security add-generic-password -U -l scripting-account-pw -a $USER -s "scripting: $USER" -w $pw
}

sudo_askpass_del() {
    _tmp=$(/usr/bin/security delete-generic-password -l scripting-account-pw -a $USER -s "scripting: $USER")
}

# helper function for when the following command needs `sudo` active but shouldn't be called with it
renew_sudo() {
    /usr/bin/security find-generic-password -l 'scripting-account-pw' -a $USER -w
}
