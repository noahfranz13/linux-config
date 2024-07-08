#!/bin/bash
set -e


cd "$(dirname "$0")"
FILEDIR="$(pwd)"
EMACSDIR="$HOME/.emacs.d"

### EMACS CONFIG ###
if [ ! -d $EMACSDIR ]; then
    mkdir $EMACSDIR
fi
# first symlink the .emacs.d directory
ln -s $FILEDIR/.emacs.d/init.el $EMACSDIR/init.el
ln -s $FILEDIR/.emacs.d/nano-emacs $EMACSDIR/nano-emacs
# then install the fonts
$FILEDIR/.emacs.d/fonts/install-fonts.sh

### BASH CONFIG ###
sed -i "1s|^|source ${FILEDIR}/.bashrc\n\n|g" $HOME/.bashrc
sed -i '1s/^/# Source the rest of the bashrc from the github repo\n/g' $HOME/.bashrc
