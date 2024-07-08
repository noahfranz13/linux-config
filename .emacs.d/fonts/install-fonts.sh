#!/bin/bash

FONTDIR="$HOME/.local/share/fonts" # for linux
FILEDIR=$(dirname -- $0)

if [ ! -d $FONTDIR ]; then
    mkdir $FONTDIR
fi

cp $FILEDIR/*.ttf $FONTDIR
