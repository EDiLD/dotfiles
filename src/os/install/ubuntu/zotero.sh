#!/bin/bash
#

VERSION="4.0.29.10"
if [ `uname -m` == "x86_64" ]; then
	ARCH="x86_64"
else
	ARCH="i686"
fi
TMP="/tmp/zotero.tar.bz2"
DEST_FOLDER=zotero
EXEC=zotero

echo ">>> Installing locally"
DEST="$HOME"
MENU_PATH="$HOME/.local/share/applications/zotero.desktop"
MENU_DIR="$HOME/.local/share/applications"

URL="http://download.zotero.org/standalone/$VERSION/Zotero-${VERSION}_linux-$ARCH.tar.bz2"

wget $URL -O $TMP

if [ -d $DEST/$DEST_FOLDER ]; then
	rm -Rf $DEST/$DEST_FOLDER
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
