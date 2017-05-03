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

remove_package(){
    apt-get purge "$1"
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

install_gis() {

    if ! package_is_installed "qgis"; then
        execute "sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable"
        update
        execute "sudo apt-get install --allow-unauthenticated -qqy qgis" "qgis"
        execute "sudo apt-get install --allow-unauthenticated -qqy grass grass-dev" "grass"   
        execute "sudo ldconfig -v"   "ldconfig"   
    else
        print_success "qgis"
    fi
}


install_z() {
    execute "sudo wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh" "Download z"
}

install_scp() {
    	if [ -f /home/edisz/.fonts/SourceCodePro-Regular.otf ]; then
        	print_success "Source Code Pro"
	else
		wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
		unzip 1.050R-it.zip
		mkdir -p ~/.fonts
		mv source-code-pro-2.030R-ro-1.050R-it/OTF/*.otf ~/.fonts
		rm -r 1.050R-it.zip source-code-pro-2.030R-ro-1.050R-it
		fc-cache -f -v
	fi
}

install_zsh() {
    # install zsh
    install_package "zsh" "zsh"

    # ask to replace configs
    if [ -f /home/edisz/.zshrc ]; then
        ask_for_confirmation "Found /home/edisz/.zshrc. Repace?"
        if answer_is_yes; then
            execute "rm -rf /home/edisz/.oh-my-zsh" "rm -rf /home/edisz/.oh-my-zsh"
            execute "rm /home/edisz/.zshrc" "rm /home/edisz/.zshrc"
        fi
    fi

    # install oh-my-zsh
    print_in_yellow 'run sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    Done?'
    ask_for_confirmation
    install_package "zsh-syntax-highlighting" "zsh-syntax-highlighting"
}

install_arc() {
	if ! package_is_installed "arc-theme"; then
	# add key
		wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
		sudo apt-key add - < Release.key
		sudo apt-get update
		rm Release.key
	# install theme
		sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
		sudo apt-get update
		sudo apt-get install arc-theme
	# aks for change
		print_in_yellow "Changed theme to arc-dark? >Appearance>style and > Window manager>style.
		Done?"
		ask_for_confirmation
	fi
}

install_sublime_pc() {
	execute "wget -P '/home/edisz/.config/sublime-text-3/Installed Packages/' https://packagecontrol.io/Package%20Control.sublime-package" "Download package control"
        # install word count https://github.com/titoBouzout/WordCount
 	if [ -d '/home/edisz/.config/sublime-text-3/Packages/WordCount' ]; then
		rm -rf /home/edisz/.config/sublime-text-3/Packages/WordCount
	fi
	execute "git clone https://github.com/titoBouzout/WordCount.git /home/edisz/.config/sublime-text-3/Packages/WordCount" "Install word count"
}

install_docker() {
    install_package "apt-transport-https" "apt-transport-https"
    install_package "ca-certificates" "ca-certificates"
    install_package "software-properties-common" "software-properties-common"
    execute "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -" "Add Docker key"
    execute "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'"
    update
    install_package "docker-ce" "docker-ce"
    # setup proxies
    execute "mkdir -p /etc/systemd/system/docker.service.d" "Create systemd"
    execute "echo '[Service]' | sudo tee --append /etc/systemd/system/docker.service.d/http-proxy.conf"
    execute "echo 'Environment="HTTP_PROXY=http://***REMOVED***/" ""NO_PROXY=localhost,127.0.0.1,docker-registry, basf.net, basf-ag.de""' | sudo tee --append /etc/systemd/system/docker.service.d/http-proxy.conf"
    execute "sudo systemctl daemon-reload" ""
    execute "sudo systemctl restart docker" "Restart docker"
}

install_neo4j() {
    execute "wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -" "get neo4j key"
    execute "echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list" "Add repo"
    update
    install_package "neo4j=3.1.2" "neo4j=3.1.2"
}

# install_vmtools() {
#     # add keys
#     execute "wget http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-DSA-KEY.pub"
#     execture "wget http://packages.vmware.com/tools/keys/VMWARE-PACKAGING-GPG-RSA-KEY.pub"
#     execute "sudo apt-key add VMWARE-PACKAGING-GPG-DSA-KEY.pub"
#     execute "sudo apt-key add VMWARE-PACKAGING-GPG-RSA-KEY.pub"

#     # add to sources.list
#     execute "sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak"
#     execute "echo 'deb http://packages.vmware.com/tools/esx/4.1u1/ubuntu maverick main restricted' | sudo tee -a /etc/apt/sources.list.d/neo4j.list" "Add repo"
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
