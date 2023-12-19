# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export VISUAL=vim
export EDITOR="$VISUAL"

alias vim="vim"
alias sh="bash"
alias vimrc="vim ~/.vimrc"
alias vim-reload="vim +source ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias bash-reload="source ~/.bashrc"
alias kinit="kdestroy; kinit"
alias vim-mr="vim -c /'<< HEAD'"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

PATH=$PATH:$LOCAL_BIN
