# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set bash options
shopt -s autocd
shopt -s checkwinsize
shopt -s direxpand
shopt -s dotglob
shopt -s globstar
shopt -s xpg_echo
shopt -s histappend


# Set colors
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
WHITE='\[\033[00m\]'


# Set PS1
PS1="${debian_chroot:+($debian_chroot)}${GREEN}\$${WHITE} "


# Add /usr/local/bin to $PATH
export PATH=/usr/local/bin:$PATH
if [[ -d "$HOME/bin" ]] ; then
    PATH="$HOME/bin:$PATH"
fi


# Common Settings
export HISTSIZE=1000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
export DISPLAY=localhost:0:0
export VISUAL='vim'
export LS_COLORS='di=01;35'
export XDG_CONFIG_HOME="$HOME/.config"

# Include .bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Include .bash_local
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

