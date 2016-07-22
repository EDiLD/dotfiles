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

    # # GnuPG archive keys of the Debian archive
    # install_package "GnuPG archive keys" "debian-archive-keyring"

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    #install_package "Ubuntu Restricted Extras" "ubuntu-restricted-extras"

    print_in_green "\n  ---\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "bash-completion" "bash-completion"

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

        sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 5044912E  

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

    install_package "JAGS" "jags"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Beamer" "latex-beamer"
    install_package "latexdiff" "latexdiff"
    install_package "latexmk" "latexmk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "leafpad" "leafpad"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "libssl" "libssl-dev"
    install_package "libcurl" "libcurl4-openssl-dev"
    install_package "libcairo" "libcairo2"
    install_package "libcairo2" "libcairo2-dev"
    install_package "libgeos" "libgeos-dev"
    install_package "libgdal1h" "libgdal1h"
    install_package "libpq" "libpq-dev"
    install_package "libxml2" "libxml2-dev"
    install_package "mesa-common-dev" "mesa-common-dev"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "writer2latex" "libreoffice-writer2latex"
    install_package "presenter-console" "libreoffice-presenter-console"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "lm-sensors" "lm-sensors"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "nano" "nano"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "openjdk7" "openjdk-7-jdk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pandoc" "pandoc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pdftk" "pdftk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pgadmin" "pgadmin3"    

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed "r-base"; then

        # add key
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

        add_to_source_list "https://cloud.r-project.org/bin/linux/ubuntu/ trusty/" "cran.list" \
            || print_error "R (add to package resource list)"

        update &> /dev/null \
            || print_error "R (resync package index files)"

    fi

    install_package "R-base" "r-base"
    install_package "R-base-core" "r-base-core"
    install_package "R-base-dev" "r-base-dev"
    install_package "r-recommendedcd source" "r-recommended"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "rbenv" "rbenv"   

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "rhythmbox" "rhythmbox"    

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    [ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
    sudo git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
    sudo fc-cache -f -v

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "sublime-text" "sublime-text"

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

    if ! package_is_installed "tor-browser"; then
        add_ppa "webupd8team/tor-browser"
        update

    fi
    
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
