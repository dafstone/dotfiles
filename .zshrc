# PATH Stuff
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/.rvm/bin"  # Add RVM to PATH for scripting
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=/usr/local/bin/vim
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Plugin Definition

plugins=(git ruby rails mosh osx web-search vi-mode gulp vagrant tmux brew bundler)

# Go Path Stuff
export GOPATH=$HOME/host/go

# ZSH Options

setopt correct

# Aliases 
alias zshcfg="vim ~/.zshrc"
alias vimcfg="vim ~/.vimrc"
alias lsa="ls -alh"


# ZSH Globals

export UPDATE_ZSH_DAYS=7                # Update every week

# zsh configuration

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"          # Waiting dots
HIST_STAMPS="mm.dd.yyyy"                # history timestamp formatting

# DISABLE_CORRECTION="true"             # Disable command autocorrection
# CASE_SENSITIVE="true"                 # Case sensitive completion
# DISABLE_UNTRACKED_FILES_DIRTY="true"  # Don't show untracked files
# ZSH_CUSTOM=/path/to/new-custom-folder # Use alternative custom folder


source $ZSH/oh-my-zsh.sh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# User configuration


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stone/.zshrc'

autoload -U zmv
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Adding vim behavior to shell

bindkey -v

source ~/.zsh_alias
