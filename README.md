# Dan's Dotfiles

Personal configuration files for development environment setup.

## Quick Start

1. Clone this repository to `~/.dotfiles`
2. Create symlinks to the configuration files you want to use
3. See individual configuration documentation below

## Configurations Included

### 🖥️ Terminal & Shell
- **tmux** (`.tmux.conf`) - Terminal multiplexer with vim-style navigation and advanced scrolling
- **zsh** (`.zshrc`) - Shell configuration with custom aliases and tools
- **bash** (`.bash_profile`, `.bashrc`) - Bash shell configuration

### ⚡ Editor
- **vim** (`.vimrc`) - Vim editor configuration
- **nvim** (`.nvimrc`) - Neovim configuration

### 🔧 Development Tools
- **git** (`.git_aliases`, `.gitignore_global`) - Git aliases and global ignore patterns
- **docker** (`.docker_aliases`) - Docker command shortcuts
- **ctags** (`.ctags`) - Code indexing configuration
- **irb** (`.irbrc`) - Ruby REPL configuration

## Key Features

### Tmux Advanced Controls
- **Fast keyboard scrolling** - Page Up/Down, Ctrl+U/D for navigation
- **Text selection scrolling** - Scroll while selecting text without losing selection
- **Vim integration** - Seamless navigation between vim and tmux panes
- **Custom key bindings** - Ctrl+A prefix with intuitive shortcuts

👉 **[See detailed tmux controls documentation](docs/tmux.md)**

### Vim/Neovim Setup
- Vi-style key bindings across all tools
- Tmux-vim navigation integration
- Custom key mappings and plugins

### Development Workflow
- Git aliases for common operations
- Docker shortcuts for container management
- Ruby development tools and IRB enhancements

## Installation

### Manual Symlink Setup
```bash
# Clone the repository
git clone <repository-url> ~/.dotfiles
cd ~/.dotfiles

# Create symlinks for the configurations you want
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# For neovim configuration
mkdir -p ~/.config
ln -sf ~/.dotfiles/config_dir/nvim ~/.config/nvim

# ... add other configurations as needed
```

### Source Shell Configuration
```bash
# For zsh users
source ~/.zshrc

# For bash users
source ~/.bash_profile
```

## Documentation

- [Tmux Controls & Features](docs/tmux.md) - Complete guide to tmux key bindings and features
- [Vim Configuration](docs/vim.md) - Vim setup and customizations
- [Shell Aliases](docs/shell.md) - Available aliases and shortcuts

## Customization

Each configuration file includes comments explaining the settings. Feel free to modify them to suit your preferences.

## Requirements

- tmux 2.1+
- vim/neovim
- zsh (for zsh configuration)
- git
- Ruby (for IRB configuration)

## Contributing

This is a personal dotfiles repository, but suggestions and improvements are welcome via issues or pull requests.