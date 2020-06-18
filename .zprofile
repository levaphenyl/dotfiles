# Auto-start Xorg when logging in on TTY1
# From: https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi
