# PATH Stuff
export PATH="$PATH:$HOME/.rvm/bin"  # Add RVM to PATH for scripting
setopt correct                      # Add spelling autocorrect
setopt extended_glob                # Add extended globbing

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/stone/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
