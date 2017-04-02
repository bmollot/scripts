#!/bin/bash

BELL="$HOME/.config/sounds/bell"
if [ -f $BELL ]
	then mpv $BELL
fi
echo -ne '\a'
