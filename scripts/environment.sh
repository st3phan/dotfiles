install_brew() {
    renew_sudo
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
    brew analytics off
}

install_node() {
  brew install node
  # install some packages
  #npm install --global eslint eslint-plugin-immutable eslint-plugin-shopify jsonlint neovim nightmare prettier
}