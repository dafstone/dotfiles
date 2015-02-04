# PATH Stuff
export ZSH=$HOME/.oh-my-zsh
export PATH="$PATH:$HOME/.rvm/bin"  # Add RVM to PATH for scripting

# Plugin Definition

plugins=(git ruby rails mosh osx web-search vi-mode gulp vagrant tmux brew)

# ZSH Options

setopt correct

# Aliases 
alias zshcfg="vim ~/.zshrc"
alias vimcfg="vim ~/.vimrc"
alias lsa="ls -alh"


# ZSH Globals

export UPDATE_ZSH_DAYS=7                # Update every week
export EDTIOR=/usr/local/bin/vim

# zsh configuration

ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"          # Waiting dots
HIST_STAMPS="mm.dd.yyyy"                # history timestamp formatting

# DISABLE_CORRECTION="true"             # Disable command autocorrection
# CASE_SENSITIVE="true"                 # Case sensitive completion
# DISABLE_UNTRACKED_FILES_DIRTY="true"  # Don't show untracked files
# ZSH_CUSTOM=/path/to/new-custom-folder # Use alternative custom folder


source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# Set vim as editor
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
