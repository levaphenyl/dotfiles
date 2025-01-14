# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt incappendhistory  # Write history upon enter, not shell exit.
setopt histignorealldups  # Remove oldest command duplicate from the list.

setopt extendedglob  # Treat '#', '~', and '^' as patterns for filename generation.
setopt notify  # Immediately report status of background jobs.
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
autoload -Uz promptinit
promptinit
prompt spaceship
SPACESHIP_TIME_SHOW=true
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_CHAR_COLOR_SUCCESS=10
SPACESHIP_CHAR_COLOR_FAILURE=9
SPACESHIP_TIME_COLOR=11
SPACESHIP_DIR_COLOR=14
SPACESHIP_DIR_LOCK_COLOR=9
SPACESHIP_GIT_BRANCH_COLOR=13
SPACESHIP_VENV_COLOR=12

# Exports
EDITOR=vim
QT_FONT_DPI=1.1
XDG_CONFIG_HOME=~/.config

# Aliases
alias ll='ls -lah'
alias tree='tree -C'
alias grep='grep --color'
alias pgrep='pgrep -l'
alias pkill='pkill -e'
alias pacman='pacman --color auto'
alias yay='yay --color auto --editmenu'

# Syntax highlight and suggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U +X bashcompinit && bashcompinit
