# Stone's Bash Profile for Local Use

# Environment Setup

PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export EDITOR=vim
export PATH
source $(brew --prefix nvm)/nvm.sh

# Setup for including .bashrc (OSX)

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
    fi
fi

# Chef Initialization (I think)

eval "$(/Users/stone/.chefvm/bin/chefvm init -)"

# Aliases
# Todo: Setup Git Aliases
# . ~/.git_aliases

alias pwgen='ruby /Users/stone/scripts/passwordgen.rb'
alias miner='mosh --ssh="ssh -p 23456" root@dafs.no-ip.biz'


# Version managers added 'as functions' to shell session - Todo: Understand this better

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

