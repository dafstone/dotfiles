# PATH Stuff
export ZSH=$HOME/.oh-my-zsh
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=/usr/local/bin/vim

# Go Path Stuff
export GOPATH=$HOME/host/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
source ~/.profile_secrets

# Oh-my-zsh Configuration

plugins=(git mosh rails osx web-search vi-mode gulp vagrant tmux brew bundler autojump aws history-substring-search docker)
export UPDATE_ZSH_DAYS=7                # Update every week
COMPLETION_WAITING_DOTS="true"          # Waiting dots
HIST_STAMPS="mm.dd.yyyy"                # history timestamp formatting

# Check for Iterm2 to start Powerline. If not, an oh-my-zsh theme

if [ -z "$ITERM_SESSION_ID" ]; then
  ZSH_THEME="flazz"
  source $ZSH/oh-my-zsh.sh
else
  source $ZSH/oh-my-zsh.sh
  . /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

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

# Configuration Aliases 
alias zshcfg="vim ~/.zshrc"
alias vimcfg="vim ~/.vimrc"
alias install_global_gems="bundle install --system --gemfile ~/Gemfile_Global"

# Init Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Init rbenv, pyenv, & nvm

eval "$(rbenv init -)"
eval "$(pyenv init -)" 
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stone/.zshrc'

autoload -U zmv
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Adding vim behavior to shell

source ~/.dotfiles/k/k.sh
source ~/.dotfiles/bundler-exec.sh

# Alias Files

source ~/.zsh_alias
source ~/.docker_aliases

#cowsay configuration
COWPATH=/Users/stone/host/emn-control/cows
ANSIBLE_COW_SELECTION=brahmin

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

source ~/.dotfiles/zsh_additions/_docker.zsh

source ~/.dotfiles/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(kubectl completion zsh)
