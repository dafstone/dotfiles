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
export PATH=~/src/mf-cli:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=/usr/local/bin/vim
export SRC_DIR=src


# Go Path Stuff
export GOPATH=$HOME/$SRC_DIR/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:~/$SRC_DIR/go/bin
source ~/.profile_secrets

# Android Studio
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Oh-my-zsh Configuration

plugins=(git git-flow-avh npm nvm npx mosh rails osx web-search vi-mode gulp vagrant tmux brew bundler autojump aws history-substring-search docker)
export UPDATE_ZSH_DAYS=7                # Update every week
COMPLETION_WAITING_DOTS="true"          # Waiting dots
HIST_STAMPS="mm.dd.yyyy"                # history timestamp formatting

# Check for Iterm2 to start Powerline. If not, an oh-my-zsh theme

if [ -z "$ITERM_SESSION_ID" ]; then
  ZSH_THEME="flazz"
  source $ZSH/oh-my-zsh.sh
else
  source $ZSH/oh-my-zsh.sh
  . /Users/stone/Library/Python/3.8/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
fi
 
shelltiming "Init Oh-my-zsh"

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

# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export PATH="/usr/local/opt/python/libexec/bin:$PATH"
eval "$(pyenv init --path)" 

shelltiming "Init Python"

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"
shelltiming "Init nvm"

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

source ~/.dotfiles/k/k.sh

shelltiming "Init K and Bundler-Exec"
# Alias Files

source ~/.zsh_alias
source ~/.docker_aliases
source ~/.dotfiles/.local_aliases

shelltiming "Sourced zsh and docker aliases"

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

source ~/.dotfiles/zsh_additions/_docker.zsh
shelltiming "source docker zsh"

source ~/.dotfiles/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
shelltiming "source zsh navigation tools"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/stone/src/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/stone/src/google-cloud-sdk/path.zsh.inc'
fi


# The next line enables shell command completion for gcloud.
if [ -f /Users/stone/src/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/stone/src/google-cloud-sdk/completion.zsh.inc'
fi

shelltiming "Init Google Cloud zsh"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

shelltiming "Init ZSH Syntax Highlighting"

source <(kubectl completion zsh)
shelltiming "Init Kubectl"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
shelltiming "Init Krew"

export CLOUDSDK_PYTHON="$(which python)"

source ~/.dotfiles/bundler-exec.sh
source ~/.envkeys

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

export AWS_PROFILE=ahr

eval "$(direnv hook zsh)"

# Uncomment for helm2
# export PATH="/usr/local/opt/helm@2/bin:$PATH"


# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/stone/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/stone/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/stone/opt/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/stone/opt/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
