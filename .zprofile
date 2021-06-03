# Export locales before starting Xorg
export LANG="en_US.utf8"
export LC_MESSAGES="en_US.utf8"
export LC_MONETARY="fr_BE.utf8"
export LC_PAPER="fr_BE.utf8"
export LC_MEASUREMENT="fr_BE.utf8"
export LC_ADDRESS="fr_BE.utf8"
export LC_TIME="fr_BE.utf8"

# Auto-start Xorg when logging in on TTY1
# From: https://wiki.archlinux.org/index.php/Xinit#Autostart_X_at_login
# From: https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x721.html

check_tty() {
    local temp=$(tty)
    echo ${temp:5}
}

if [ $(check_tty) = "tty1" ]; then
    # Workaround when the TTY permission change.
    # From: https://bugs.archlinux.org/task/58159
    # From: https://github.com/systemd/systemd/issues/10103
    chmod 1600 /dev/tty1
    exec startx
fi

