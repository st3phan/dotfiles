run_install_dotfiles() {
    curl --progress-bar --location 'https://github.com/st3phan/dotfiles/archive/master.zip' | ditto -xk - '/tmp'

    # source all shell scripts
    for shell_script in '/tmp/dotfiles-master/scripts/'*.sh; do
        source "${shell_script}"
    done

    clear

    # Setup
    initial_setup
    ask_details
    update_system

    # Environment
    install_brew
    install_node

    # Apps
    install_brew_apps
    install_cask_apps
    install_mas_apps
    
    #sudo_askpass_del
    killall caffeinate # computer can go back to sleep
}

# run and log errors to file (but still show them when they happen)
readonly error_log="${HOME}/Desktop/install_errors.log"
run_install_dotfiles 2> >(tee "${error_log}")