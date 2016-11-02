#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_key() {

    wget -qO - "$1" | sudo apt-key add - &> /dev/null
    #     │└─ write output to file
    #     └─ don't show output

}

add_ppa() {
    sudo add-apt-repository -y ppa:"$1" &> /dev/null
}

add_to_source_list() {
    sudo sh -c "printf 'deb $1' > '/etc/apt/sources.list.d/$2'"
}

autoremove() {

    # Remove packages that were automatically installed to satisfy
    # dependencies for other packages and are no longer needed

    execute \
        "sudo apt-get autoremove -qqy" \
        "autoremove"

}

install_url() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"
    declare -r URL="$3"
    FILE=`mktemp` 

    if ! package_is_installed "$PACKAGE"; then
        execute 'wget "$URL" -qO $FILE && sudo dpkg -i $FILE' "$PACKAGE_READABLE_NAME"
        rm $FILE
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

install_package() {

    declare -r PACKAGE="$2"
    declare -r PACKAGE_READABLE_NAME="$1"

    if ! package_is_installed "$PACKAGE"; then
        execute "sudo apt-get install --allow-unauthenticated -qqy $PACKAGE" "$PACKAGE_READABLE_NAME"
        #                                      suppress output ─┘│
        #            assume "yes" as the answer to all prompts ──┘
    else
        print_success "$PACKAGE_READABLE_NAME"
    fi

}

install_zotero() {
    VERSION="4.0.29.10"
    if [ `uname -m` == "x86_64" ]; then
        ARCH="x86_64"
    else
        ARCH="i686"
    fi
    TMP="/tmp/zotero.tar.bz2"
    DEST_FOLDER='zotero'

    DEST="/opt"
    MENU_PATH="/usr/share/applications/zotero.desktop"
    MENU_DIR="/usr/share/applications"

    if [ -d $DEST/$DEST_FOLDER ]; then
        print_success "Zotero"

    else

        URL="http://download.zotero.org/standalone/$VERSION/Zotero-${VERSION}_linux-$ARCH.tar.bz2"
        wget $URL -O $TMP
        sudo tar -xpf $TMP -C $DEST
        sudo mv $DEST/Zotero_linux-$ARCH $DEST/$DEST_FOLDER

        if [ -f $MENU_DIR ]; then
            sudo mkdir $MENU_DIR
        fi
        sudo sh -c "echo '[Desktop Entry]
        Name=Zotero
        Comment=Open-source reference manager (standalone version)
        Exec=$DEST/$DEST_FOLDER/zotero
        Icon=accessories-dictionary
        Type=Application
        StartupNotify=true' > $MENU_PATH"
    fi
}

install_dropbox() {
    if [ -d '$HOME/.dropbox-dist/dropboxd' ]; then
        print_success "Dropbox"
    else
        if [ `uname -m` == "x86_64" ]; then
            execute 'cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -' 'Dropbox'
        else
            execute 'cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -' 'Dropbox'
        fi
        ~/.dropbox-dist/dropboxd &
    fi
}

install_gis() {

    if ! package_is_installed "qgis"; then
        execute "sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable"
        update
        execute "sudo apt-get install --allow-unauthenticated -qqy qgis" "qgis"
        execute "sudo apt-get install --allow-unauthenticated -qqy grass" "grass"   
        execute "sudo ldconfig -v"   "ldconfig"   
    else
        print_success "qgis"
    fi
}

install_photo() {

    execute "sudo add-apt-repository -y ppa:dhor/myway"
    update
    execute "sudo apt-get install --allow-unauthenticated -qqy rawtherapee" "rawtherapee" 
    execute "sudo apt-get install --allow-unauthenticated -qqy hdrmerge" "hdrmerge"  
    execute "sudo apt-get install --allow-unauthenticated -qqy luminance-hdr" "luminance-hdr" 
    execute "sudo add-apt-repository -y ppa:hugin/hugin-builds"
    update
    execute "sudo apt-get install --allow-unauthenticated -qqy hugin enblend" "hugin" 
}

install_z() {
    execute "wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh" "Download z"
}

# install_arc() {
#     install_package "gtk2-engines-murrine" "gtk2-engines-murrine"
#     install_package "libgtk-3-dev" "libgtk-3-dev"
#     execute "cd Downloads && git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme" " Clone arc repository"
#     execture "./autogen.sh --prefix=/usr --disable-light --disable-darker --disable-cinnamon -disable-unity"
# }

package_is_installed() {
    dpkg -s "$1" &> /dev/null
}

update() {

    # Resynchronize the package index files from their sources

    execute \
        "sudo apt-get update -qqy" \
        "update"

}

upgrade() {

    # Install the newest versions of all packages installed

    execute \
        "sudo apt-get upgrade -qqy" \
        "upgrade"

}
