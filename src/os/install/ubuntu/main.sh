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

    install_package "libqt5libqgtk2" "libqt5libqgtk2"
    # install_package "plasma-desktop" "plasma-desktop"
    install_package "Dolphin" "dolphin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "enigmail" "enigmail"

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

    install_package "leafpad" "leafpad"


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "writer2latex" "libreoffice-writer2latex"
    install_package "pdf-presenter-console" "pdf-presenter-console"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "lm-sensors" "lm-sensors"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "nano" "nano"

    
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

    if ! package_is_installed "owncloud-client"; then

        add_key "http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_14.04/Release.key"

        add_to_source_list "http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_14.10/ /" "owncloud-client.list" \
            || print_error "Owncloud (add to package resource list)"

        update &> /dev/null \
            || print_error "Owncloud (resync package index files)"

    fi

    install_package "Owncloud" "owncloud-client"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pandoc" "pandoc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pdftk" "pdftk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "pgadmin" "pgadmin3"    

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "preload" "preload"   

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

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_photo

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "rbenv" "rbenv"   

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "rhythmbox" "rhythmbox"    

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ## Source code pro
    install_scp


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "ruby2.3" "ruby2.3"
    install_package "ruby2.3-dev" "ruby2.3-dev"
    execute "sudo gem2.3 install jekyll" "Installing Jekyll"
    execute "sudo gem2.3 install github-pages" "Install github-pages gem"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    install_package "samba" "samba"
    install_package "smbclient" "smbclient"
    install_package "cifs-utils" "cifs-utils"
    install_package "openconnect" "openconnect"
    install_package "network-manager-openconnect" "network-manager-openconnect"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    install_package "shutter" "shutter"

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
    # Teamviewer

    install_url "Teamviewer" "teamviewer" "https://download.teamviewer.com/download/teamviewer_i386.deb"
    execute "sudo apt-get -f install" "sudo apt-get -f install"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "thunderbird" "thunderbird"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tlp" "tlp"

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

    install_package "tor" "tor"

    if ! package_is_installed "tor-browser"; then
        add_ppa "webupd8team/tor-browser"
        update
    fi
    
    install_package "tor-browser" "tor-browser"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "tree" "tree"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "unison" "unison"
    install_package "unison-gtk" "unison-gtk"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "VLC" "vlc"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "xfce4-sensors-plugin" "xfce4-sensors-plugin"
    install_package "xfce4-mount-plugin" "xfce4-mount-plugin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # zotero

    # execute 'install_zotero' 'Zotero' # script from sources
    # from ppa
    add_ppa "smathot/cogscinl "
    update
    install_package "zotero-standalone" "zotero-standalone"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package "zsh" "zsh"
    execute "rm -rf /home/edisz/.oh-my-zsh" "rm -rf /home/edisz/.oh-my-zsh"
    execute "rm /home/edisz/.zshrc" "rm /home/edisz/.zshrc"
    print_in_yellow 'run sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    Done?'
    ask_for_confirmation
    install_package "zsh-syntax-highlighting" "zsh-syntax-highlighting"

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

    print_in_yellow "Install AngrySearch. https://github.com/DoTheEvo/ANGRYsearch.
    Done?"
    ask_for_confirmation

    print_in_yellow "Copy Thunderbird Profiles.
    Done?"
    ask_for_confirmation

    print_in_yellow "Export and Import Enigmail/pgp settings?
    Done?"
    ask_for_confirmation

    print_in_yellow "Copy Firefox settings (addons, blog/feeds, bookmarks).
    Done?"
    ask_for_confirmation

    print_in_yellow "Copy .pgadmin.
    Done?"
    ask_for_confirmation

    print_in_yellow "Copy .ssh/.
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
