# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set bash options
shopt -s autocd
shopt -s checkwinsize
shopt -s direxpand
shopt -s dotglob
shopt -s globstar
#shopt -s dirspell
shopt -s xpg_echo
shopt -s histappend

# colors
GREEN='\[\033[01;32m\]'
BLUE='\[\033[01;34m\]'
WHITE='\[\033[00m\]'


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="${debian_chroot:+($debian_chroot)}${GREEN}\$${WHITE} "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

export DISPLAY=localhost:0.0

function dots() {
  case $1 in
    install) bash ~/dotfiles/install.sh ;;
    init) echo 'init' ;;
  esac
}
