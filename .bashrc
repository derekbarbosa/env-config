# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.

export OSH=/root/.oh-my-bash

if [ $EUID -ne 0 ]
then
  export OSH="/home/$USER/.oh-my-bash"
else
  export OSH=/root/.oh-my-bash
fi

completions=(
  git
  composer
  ssh
)

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export VISUAL=vim
export EDITOR="$VISUAL"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
# Useful Aliases
alias vim="vim"
alias sh="bash"
alias vimrc="vim ~/.vimrc"
alias vim-reload="vim +source ~/.vimrc"
alias bash-config="vim ~/.bashrc"
alias bash-reload="source ~/.bashrc"
alias kinit="kdestroy; kinit"
alias vim-mr="vim -c /'<< HEAD'"
alias RTBZ="awk /RTBZ/ ~/workspace/rhel8/redhat/Makefile.common"
alias rtbz="RTBZ"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

export REQUESTS_CA_BUNDLE=/etc/pki/tls/certs/ca-bundle.crt

LOCAL_BIN=/home/$USER/.local/bin

PATH=$PATH:$LOCAL_BIN
