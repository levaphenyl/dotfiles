# Commands to run in login sessions go below.
# Equivalent to .profile.
if status is-login; and test (tty) = /dev/tty1
    # Session exports:
    set -gx XDG_SESSION_TYPE wayland
    set -gx XDG_SESSION_DESKTOP sway
    set -gx XDG_CURRENT_DESKTOP sway
    #set -gx XDG_RUNTIME_DIR /var/run/user/$(id -u)

    # Wayland exports:
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx QT_QPA_PLATFORM wayland
    set -gx SDL_VIDEODRIVER wayland

    exec dbus-run-session sway
end

# Commands to run in interactive sessions go here.
# Equivalent to .bashrc.
if status is-interactive
    fish_add_path /usr/bin
    fish_add_path /usr/sbin
    # Use bash for vim to avoid E79 errors in fish.
    alias vim "SHELL=/bin/bash $(which vim)"
end
