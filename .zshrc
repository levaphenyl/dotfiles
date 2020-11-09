# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
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

# Exports
export EDITOR=vim

# Aliases
alias ll='ls -lah'
alias tree='tree -C'
alias grep='grep --color'
alias pacman='pacman --color auto'
alias yay='yay --color auto --editmenu'

# Syntax highlight and suggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault
