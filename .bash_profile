
[[ -s "/Users/stone/.rvm/scripts/rvm" ]] && source "/Users/stone/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
eval "$(/Users/stone/.chefvm/bin/chefvm init -)"

alias pwgen="ruby /Users/stone/scripts/passwordgen.rb"
alias miner="mosh --ssh="ssh -p 23456" root@dafs.no-ip.biz"
