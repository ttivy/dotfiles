alias brc='source ~/.bashrc'

alias ls='ls -lA --color=auto --group-directories-first'

alias cb='xsel --clipboard'

if [ -n $TMUX ]; then
  alias tmux='tmux attach || tmux new-session \; source-file ~/.tmux/main.layout'
fi

function jk() {
  case $1 in
    install) . ~/dotfiles/scripts/install.sh ;;
    init)    . ~/dotfiles/scripts/init.sh ;;

    src) source ~/.bashrc ;;
    *) echo 'show help' ;;
  esac
}
