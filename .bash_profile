# Stone's Bash Profile for Local Use

# PATH Stuff

[[ -s "/Users/stone/.rvm/scripts/rvm" ]] && source "/Users/stone/.rvm/scripts/rvm" # Load RVM into shell *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export EDITOR=vim

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

alias pwgen="ruby /Users/stone/scripts/passwordgen.rb"
alias miner="mosh --ssh="ssh -p 23456" root@dafs.no-ip.biz"
