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

    install_package "conky" "conky"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "cURL" "curl"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "libqt5libqgtk2" "libqt5libqgtk2"
    # install_package "plasma-desktop" "plasma-desktop"
    install_package "Dolphin" "dolphin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Firefox" "firefox"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Flash" "flashplugin-installer"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "gdal-bin" "gdal-bin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "gdebi" "gdebi"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "gnome-system-monitor" "gnome-system-monitor"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "shimmer-themes" "shimmer-themes"
    install_package "elementary-icon-theme" "elementary-icon-theme"
    if ! package_is_installed "elementary-icon-theme"; then
        print_in_yellow "Go to Appearance > Style tab. Select Greybird.
            Go to Appearance > Icons tab. Select elementary xfce dark or whatever you like.
            Go to Window Manager > Style tab. Select Greybird master.
            Done?"
        ask_for_confirmation
    fi


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "GIMP" "gimp"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "Git" "git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "gparted" "gparted"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # arc theme: https://github.com/horst3180/arc-theme
    install_arc

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "indicator-multiload" "indicator-multiload"

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
    install_package "texlive-fonts-extra" "texlive-fonts-extra"
    install_package "texlive-publishers" "texlive-publishers"
    install_package "biber" "biber"
    install_package "texinfo" "texinfo"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "writer2latex" "libreoffice-writer2latex"
    install_package "pdf-presenter-console" "pdf-presenter-console"

    
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "openbabel" "openbabel"
    install_package "libopenbabel-dev" "libopenbabel-dev"
    install_package "openbabel-gui" "openbabel-gui"
    install_package "python-openbabel" "python-openbabel"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #ocrmypdf

    install_package "python3-pip" "python3-pip"
    execute "sudo pip3 install --upgrade pip" "upgrade pip"
    install_package "libffi-dev" "libffi-dev"
    execute "sudo pip3 install ocrmypdf" "ocrmypdf"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "okular" "okular"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "openjdk-8-jdk" "openjdk-8-jdk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pandoc" "pandoc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pdftk" "pdftk" 

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
    install_package "libopenblas-dev" "libopenblas-dev"
    install_package "libatlas-base-dev" "libatlas-base-dev"
    install_package "libgsl-dev" "libgsl-dev"
    install_package "subversion" "subversion"
    install_package "ccache" "ccache"
    execute "sudo R CMD javareconf" "sudo R CMD javareconf"  

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ## Source code pro
    install_scp

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    add_ppa "webupd8team/sublime-text-3"
    update
    install_package "sublime-text-installer" "sublime-text-installer"
# install package control (this will also install missing packages after 1st start
    install_sublime_pc

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "apt-xapian-index" "apt-xapian-index"
    install_package "synaptic" "synaptic"   

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
    install_package "texlive-xetex" "texlive-xetex"
    install_package "qtikz" "qtikz"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tmux" "tmux"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tree" "tree"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "unison" "unison"
    install_package "unison-gtk" "unison-gtk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "xfce4-sensors-plugin" "xfce4-sensors-plugin"
    install_package "xfce4-mount-plugin" "xfce4-mount-plugin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_zsh

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_gis
    install_package "libssl" "libssl-dev"
    install_package "libcurl" "libcurl4-openssl-dev"
    install_package "libcairo" "libcairo2"
    install_package "libcairo2" "libcairo2-dev"
    install_package "libgeos-dev" "libgeos-dev"
    install_package "libgeos++-dev" "libgeos++-dev"
    install_package "libgdal1-dev" "libgdal1-dev"
    install_package "libproj-dev" "libproj-dev"
    install_package "libpq" "libpq-dev"
    install_package "libxml2" "libxml2-dev"
    install_package "mesa-common-dev" "mesa-common-dev"
    install_package "libglu1-mesa-dev" "libglu1-mesa-dev"
    install_package "freeglut3-dev" "freeglut3-dev"
    install_package "libgtk2.0-dev" "libgtk2.0-dev"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # multimedia stuff
    install_package "ubuntu-restricted-extras" "ubuntu-restricted-extras"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_z

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    remove_package "brltty"
    remove_package "brltty-x11"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    install_docker


     # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    install_package "unixodbc" "unixodbc"
    install_package "unixodbc-dev" "unixodbc-dev"
    install_package "alien" "alien"
    install_package "libaio1" "libaio1"


    print_in_yellow "Install Oracle drivers
    # bash
    # odbc
    # sdk / devel
    # see als R install script for ROracle

    https://help.ubuntu.com/community/Oracle%20Instant%20Client.
    http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html
    Done?"
    ask_for_confirmation
    execute "echo '/usr/lib/oracle/12.2/client64/lib' | sudo tee /etc/ld.so.conf.d/oracle.conf" "set oracle conf"
    execute "sudo ldconfig -v" "update cache"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_yellow "Setup proxies. Follow instructions in /src/os/misc/set_proxies.txt 
    Done?"
    ask_for_confirmation

    print_in_yellow "Install RStudio daily.
    Done?"
    ask_for_confirmation

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    update
    upgrade

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    print_in_green "\n  ---\n\n"
    autoremove

}

main
