#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" \
    && source 'utils.sh'

declare -r -a NPM_PACKAGES=(
    'jshint'
    'svgo'
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Check if `NVM_DIR` is set, and if it's not, it's because
    # `~/.bash.local` was not sourced, and therefore, npm won't
    # be available (this happens when the `dotfiles` are set up
    # for the first time)

    if [ -z "$NVM_DIR" ]; then
        source "$HOME/.bash.local"
    fi

    # Check if `npm` is installed
    cmd_exists 'npm'
    if [ $? -eq 1 ]; then
        print_error 'npm is required, please install it!\n'
        exit 1
    fi

    # Make sure the most recent version of `npm` is installed
    execute 'npm install --global npm' 'npm (update)'

    # Install the `npm` packages
    for i in ${NPM_PACKAGES[@]}; do
        execute "npm install --global $i" "$i"
    done

}

main