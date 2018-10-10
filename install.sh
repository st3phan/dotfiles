run_install_dotfiles() {
    curl --progress-bar --location 'https://github.com/st3phan/dotfiles/archive/master.zip' | ditto -xk - '/tmp'

    # source all shell scripts
    for shell_script in '/tmp/dotfiles-master/scripts/'*.sh; do
        source "${shell_script}"
    done

    clear

    initial_setup
    ask_details
    sync_icloud
    update_system

    install_brew
    install_node

    install_brew_apps
    install_cask_apps

    killall caffeinate # computer can go back to sleep
}

# run and log errors to file (but still show them when they happen)
readonly error_log="${HOME}/Desktop/install_errors.log"
run_install_dotfiles 2> >(tee "${error_log}")