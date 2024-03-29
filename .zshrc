# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

show_timings=false
start_time=$(gdate +%s%N)
if $show_timings = true; then
  echo "Start:" $start_time
fi

shelltiming () {
  sincestart=`expr $(gdate +%s%N) - $start_time`
  if $show_timings = true; then
    echo $1 "- ms since start:" `expr $sincestart / 1000000`
  fi
}

shelltiming "Preinitialization"


# PATH Stuff
PATH="/usr/local/bin:$(getconf PATH)"
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=$(which vim)
export SRC_DIR=src

plugins=(git git-flow-avh macos vi-mode brew bundler autojump docker history-substring-search kubectl)
export UPDATE_ZSH_DAYS=7                # Update every week
COMPLETION_WAITING_DOTS="true"          # Waiting dots
HIST_STAMPS="mm.dd.yyyy"                # history timestamp formatting
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

shelltiming "Paths"


# Go Path Stuff
# export GOPATH=$HOME/$SRC_DIR/go
# export PATH=$PATH:/usr/local/opt/go/libexec/bin:~/$SRC_DIR/go/bin
source ~/.profile_secrets

# ZSH Options

setopt correct
# bindkey '^r' history-incremental-search-backward   # History Search
bindkey -v

# History Substring Search

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

bindkey -s ^v 'vim .^M'

# Configuration Aliases 
alias zshcfg="vim ~/.zshrc"
alias vimcfg="vim ~/.vimrc"
alias install_global_gems="bundle install --system --gemfile ~/Gemfile_Global"

shelltiming "Set Aliases and Navigation"

# Init rbenv, pyenv, & nvm

eval "$(rbenv init -)"
shelltiming "Init Rbenv"

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
eval "$(pyenv init --path)" 

shelltiming "Init Python"

# Init Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

shelltiming "Init Autojump"
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stone/.zshrc'

autoload -U zmv
autoload -Uz compinit
compinit
# End of lines added by compinstall
shelltiming "Init compinit additions"

# Adding vim behavior to shell

# source ~/.dotfiles/k/k.sh

shelltiming "Init K and Bundler-Exec"
# Alias Files

source ~/.zsh_alias
source ~/.docker_aliases
source ~/.dotfiles/.local_aliases

shelltiming "Sourced zsh and docker aliases"

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

export DOCKER_DEFAULT_PLATFORM=linux/amd64
source ~/.dotfiles/zsh_additions/_docker.zsh
shelltiming "source docker zsh"

source ~/.dotfiles/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
shelltiming "source zsh navigation tools"


shelltiming "Init Google Cloud zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dan.stone/src/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dan.stone/src/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dan.stone/src/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dan.stone/src/google-cloud-sdk/completion.zsh.inc'; fi

source <(kubectl completion zsh)

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
shelltiming "Init Krew"

export CLOUDSDK_PYTHON="$(which python)"

source ~/.dotfiles/bundler-exec.sh
source ~/.envkeys

export NVM_DIR=$HOME/.nvm
[[ -s "$NVM_DIR/nvm.sh"  ]] && source "$NVM_DIR/nvm.sh" --no-use

shelltiming "Init nvm"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use --silent
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
#    echo "Reverting to nvm default version"
    nvm use default --silent
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export AWS_PROFILE=ahr

eval "$(direnv hook zsh)"

USE_GKE_GCLOUD_AUTH_PLUGIN=True

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

