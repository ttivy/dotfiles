alias brc='source ~/.bashrc'

alias ls='ls -lA --color=auto --group-directories-first'
alias ld='ls -lad --color=auto'

function jk() {
  case $1 in
    install) . ~/dotfiles/scripts/install.sh ;;
    init)    . ~/dotfiles/scripts/init.sh ;;

    src) source ~/.bashrc ;;
    *) echo 'show help' ;;
  esac
}
