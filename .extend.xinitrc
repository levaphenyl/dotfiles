#!/bin/sh
#
# ~/.extend.xinitrc
#
# Executed by startx (run your window manager from here)

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_SESSION_TYPE=x11

DEFAULT_SESSION='i3 --shmlog-size 26214400'
