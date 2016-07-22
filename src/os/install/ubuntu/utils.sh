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
    sudo sh -c "printf 'deb $1' >> '/etc/apt/sources.list.d/$2'"
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

    URL="http://download.zotero.org/standalone/$VERSION/Zotero-${VERSION}_linux-$ARCH.tar.bz2"

    wget $URL -O $TMP

    if [ -d $DEST/$DEST_FOLDER ]; then
        print_success "Zotero"
    fi

    tar -xpf $TMP -C $DEST

    mv $DEST/Zotero_linux-$ARCH $DEST/$DEST_FOLDER

    if [ -f $MENU_DIR ]; then
        mkdir $MENU_DIR
    fi

    echo "[Desktop Entry]
    Name=Zotero
    Comment=Open-source reference manager (standalone version)
    Exec=$DEST/$DEST_FOLDER/zotero
    Icon=accessories-dictionary
    Type=Application
    StartupNotify=true" > $MENU_PATH
}

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
