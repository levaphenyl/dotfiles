#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [[ -f ~/.extend.xinitrc ]];then
    . ~/.extend.xinitrc
else
    DEFAULT_SESSION=xfce4-session
fi

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

get_session(){
    local dbus_args=(--sh-syntax --exit-with-session)
    local session
    case $1 in
        awesome) session=(awesome) ;;
        bspwm) session=(bspwm-session) ;;
        budgie) session=(budgie-desktop) ;;
        cinnamon) session=(cinnamon-session) ;;
        deepin) session=(startdde) ;;
        enlightenment) session=(enlightenment_start) ;;
        fluxbox) session=(startfluxbox) ;;
        gnome) session=(gnome-session) ;;
        i3|i3wm) session=(i3 --shmlog-size 0) ;;
        jwm) session=(jwm) ;;
        kde) session=(startkde) ;;
        lxde) session=(startlxde) ;;
        lxqt) session=(lxqt-session) ;;
        mate) session=(mate-session) ;;
        xfce) session=(xfce4-session) ;;
        openbox) session=(openbox-session) ;;
        *) session=($DEFAULT_SESSION) ;;
    esac

    # From: https://github.com/i3/i3/issues/2539
    # From: https://wiki.archlinux.org/index.php/Xinit#Switching_between_desktop_environments/window_managers
    # If dbus-daemon is already started by systemd, use only exec
    if systemctl -q is-active dbus.service; then
        echo "$session"
    else
        echo "dbus-launch ${dbus_args[*]} $session"
    fi
}

exec $(get_session)


# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
xset r rate 660 25
