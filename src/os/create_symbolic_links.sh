#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
tohome() {
        sourceFile="$(cd .. && pwd)/$1"
        targetFile="$HOME/.$(printf "%s" "$1" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
toother() {
        sourceFile="$(cd .. && pwd)/$1"
        targetFile="$HOME/$2"
        targetdir=$(dirname "$targetFile")

        mkdir -p "$targetdir"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi

            fi

        fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "shell/bash_logout"
        "shell/bash_profile"
        "shell/bashrc"
        "shell/tmux.conf"

        "git/gitconfig"

        "conky/conkyrc"

        "R/Rprofile"

        "pgadmin/pgadmin3"

    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        tohome "$i"

    done

    toother "xfce4/terminal/terminalrc" ".config/xfce4/terminal/terminalrc"
    toother "xfce4/panel/whiskermenu-1.rc" ".config/xfce4/panel/whiskermenu-1.rc"
    toother "sublime-text/Package\ Control.sublime-settings" ".config/sublime-text-3/Packages/User/Package\ Control.sublime-settings"
    toother "sublime-text/Preferences.sublime-settings" ".config/sublime-text-3/Packages/User/Preferences.sublime-settings"
    toother "sublime-text/bash.sublime-build" ".config/sublime-text-3/Packages/User/bash.sublime-build"
    toother "sublime-text/xetex.sublime-build" ".config/sublime-text-3/Packages/User/xetex.sublime-build"
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_info "Create symbolic links"
    create_symlinks "$@"
}

main "$@"
