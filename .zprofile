# Auto-start Xorg when logging in on TTY1
# From: https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login
# From: https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x721.html

check_tty() {
    local temp=$(tty)
    echo ${temp:5}
}

if [ $(check_tty) = "tty1" ]; then
    exec startx
else
    echo $(check_tty)
fi
