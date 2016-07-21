#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    update
    upgrade

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Tools for compiling/building software from source
    install_package "Build Essential" "build-essential"

    # GnuPG archive keys of the Debian archive
    install_package "GnuPG archive keys" "debian-archive-keyring"

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    #install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "google-chrome-unstable"; then

        # add key
        apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

        add_to_source_list "https://cloud.r-project.org/bin/linux/ubuntu/ trusty/" "cran.list" \
            || print_error "R (add to package resource list)"

        update &> /dev/null \
            || print_error "R (resync package index files)"

    fi

    install_package "R" "r-base"
    install_package "R" "r-base-core"
    install_package "R" "r-base-dev"
    install_package "R" "r-recommended"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Chromium" "chromium-browser"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Disk Usage Analyzer" "baobab"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "conky" "conky"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "cURL" "curl"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Dolphin" "dolphin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "dropbox"; then

        add_to_source_list "[arch=i386,amd64] http://linux.dropbox.com/ubuntu trusty main" "dropbox.list" \
            || print_error "dropbox (add to package resource list)"

        update &> /dev/null \
            || print_error "dropbox (resync package index files)"

    fi

    install_package "dropbox" "dropbox"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "enigmail" "enigmail"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Firefox" "firefox"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Flash" "flashplugin-installer"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "gdebi" "gdebi"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GIMP" "gimp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "ImageMagick" "imagemagick"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Inkscape" "inkscape"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Beamer" "latex-beamer"
    install_package "latexdiff" "latexdiff"
    install_package "latexmk" "latexmk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "writer2latex" "libreoffice-writer2latex"
    install_package "presenter-console" "libreoffice-presenter-console"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "lm-sensors" "lm-sensors"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "nano" "nano"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pandoc" "pandoc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pdftk" "pdftk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pgadmin" "pgadmin"    

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "rhythmbox" "rhythmbox"    

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "thunderbird" "thunderbird"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "texi2html" "texi2html"
    install_package "texlive" "texlive"
    install_package "texlive-base" "texlive-base"
    install_package "texlive-bibtex-extra" "texlive-bibtex-extra"
    install_package "texlive-extra-utils" "texlive-extra-utils"
    install_package "texlive-latex-base" "texlive-latex-base"
    install_package "texlive-latex-extra" "texlive-latex-extra"
    install_package "texlive-latex-recommended" "texlive-latex-recommended"
    install_package "texlive-math-extra" "texlive-math-extra"
    install_package "texlive-science" "texlive-science"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tmux" "tmux"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tor" "tor"
    install_package "tor-browser" "tor-browser"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "unison" "unison"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "VLC" "vlc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    update
    upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    autoremove

}

main
