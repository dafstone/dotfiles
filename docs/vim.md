# Vim/Neovim Configuration Guide

This configuration provides a modern development environment with LSP support, AI integration, and seamless tmux navigation.

## Overview

- **Plugin Manager**: vim-plug
- **Theme**: Aurora with 24-bit color support
- **Primary Editor**: Neovim (with vim fallback support)
- **Language Support**: Go, Python, and general programming languages
- **AI Integration**: GitHub Copilot and CodeCompanion

## Key Features

### 🎨 Visual Configuration
- **Aurora colorscheme** with transparent background
- **Airline status bar** with Luna theme
- **Powerline fonts** for enhanced visual elements
- **Relative line numbers** with current line number display
- **24-bit true color** support (`termguicolors`)

### 🔗 Tmux Integration
- **vim-tmux-navigator** - Seamless navigation between vim and tmux panes
- **Unified keybindings** - `Ctrl+H/J/K/L` work in both vim and tmux
- **Shared clipboard** configuration

### 🤖 AI-Powered Development
- **GitHub Copilot** - AI code completion and suggestions
- **CodeCompanion** - Advanced AI chat and code assistance
- Integration with modern AI development workflows

### 📁 File Management
- **NERDTree** - File explorer with tree view
- **CtrlP** - Fuzzy finder for files, buffers, and MRU
- **Ack.vim** - Fast text searching with AG (The Silver Searcher)

### 🔧 Language Support
- **LSP (Language Server Protocol)** via nvim-lspconfig
- **Treesitter** - Advanced syntax highlighting and code understanding
- **Go.nvim** - Comprehensive Go language support
- **Python** support with configured interpreter

## Essential Keybindings

### Navigation
| Key Combination | Action |
|----------------|--------|
| `Ctrl+H` | Move to left window/pane |
| `Ctrl+J` | Move to window/pane below |
| `Ctrl+K` | Move to window/pane above |
| `Ctrl+L` | Move to right window/pane |

### File Operations
| Key Combination | Action |
|----------------|--------|
| `Ctrl+P` | Open CtrlP fuzzy finder |
| `:NERDTree` | Open file explorer |
| `:Ack {pattern}` | Search for text across files |

### AI Assistance
| Command | Action |
|---------|--------|
| `:Copilot enable` | Enable GitHub Copilot |
| `:CodeCompanion` | Open AI chat interface |

## Plugin Configuration

### Core Plugins
```vim
Plug 'ray-x/aurora'                          " Color scheme
Plug 'christoomey/vim-tmux-navigator'        " Tmux integration
Plug 'github/copilot.vim'                   " GitHub Copilot
Plug 'scrooloose/nerdtree'                  " File explorer
Plug 'mileszs/ack.vim'                      " Text search
Plug 'kien/ctrlp.vim'                       " Fuzzy finder
```

### Language Support
```vim
Plug 'neovim/nvim-lspconfig'                " LSP support
Plug 'nvim-treesitter/nvim-treesitter'      " Syntax highlighting
Plug 'ray-x/go.nvim'                        " Go development
Plug 'ray-x/guihua.lua'                     " GUI components
```

### AI Integration
```vim
Plug 'nvim-lua/plenary.nvim'                " Lua utilities
Plug 'olimorris/codecompanion.nvim'         " AI assistance
```

## Configuration Files

### Structure
```
.vim/
├── plugins.vim           # Plugin definitions
├── look-and-feel.vim     # Visual configuration
├── ddc-config.vim        # Completion configuration (optional)
└── autoload/             # Auto-loaded functions

config_dir/nvim/
├── init.vim              # Neovim initialization (sources .vimrc)
└── postload.lua          # Lua configuration (LSP setup)
```

### Key Settings
- **No swap files** - `set noswapfile`
- **Mouse support** - `set mouse=a`
- **UTF-8 encoding** - `set encoding=utf-8`
- **256 color support** - `set t_Co=256`

## Language-Specific Features

### Go Development
- **go.nvim** - Full Go language support
- **LSP integration** - Automatic code completion and error checking
- **Build and test integration** - Run Go commands from within vim

### Python Development
- **Configured interpreter** - `/Users/dan.stone/.pyenv/versions/3.11.0/bin/python3`
- **LSP support** - Code completion and linting
- **Syntax highlighting** via Treesitter

### General Programming
- **Treesitter** - Enhanced syntax highlighting for many languages
- **LSP** - Language server support for various languages
- **Indent guides** - Visual indentation helpers

## Search and Navigation

### Ack Configuration
```vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
```
- Uses **The Silver Searcher (ag)** for fast text search
- Integrates with ack.vim for in-editor results

### CtrlP Fuzzy Finding
- **Quick file access** - Find files by typing partial names
- **Buffer navigation** - Quick switching between open files
- **MRU (Most Recently Used)** - Access recently opened files

## Customization

### Color Scheme Options
The Aurora theme includes several customization options:
```vim
let g:aurora_italic = 1        " Enable italics
let g:aurora_transparent = 1   " Transparent background
let g:aurora_bold = 1          " Bold text
let g:aurora_darker = 1        " Darker background
```

### Airline Theme
```vim
let g:airline_theme='luna'     " Status bar theme
let g:airline_powerline_fonts = 1  " Use powerline fonts
```

### Indent Guides
```vim
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
```

## Installation

### Prerequisites
1. **Neovim** or **Vim 8+**
2. **vim-plug** plugin manager
3. **The Silver Searcher (ag)** for search functionality
4. **Powerline fonts** for status bar

### Setup
1. Link the vim configuration:
   ```bash
   ln -sf ~/.dotfiles/.vimrc ~/.vimrc
   ln -sf ~/.dotfiles/.vim ~/.vim
   ```

2. Link the neovim configuration:
   ```bash
   mkdir -p ~/.config
   ln -sf ~/.dotfiles/config_dir/nvim ~/.config/nvim
   ```

3. Install vim-plug (if not already installed):
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. Install plugins:
   ```vim
   :PlugInstall
   ```

5. Install language servers (optional, for LSP support):
   ```bash
   # Go language server
   go install golang.org/x/tools/gopls@latest

   # Python language server
   pip install python-lsp-server
   ```

## AI Development Workflow

### GitHub Copilot
1. **Setup**: Authenticate with `:Copilot setup`
2. **Usage**: Type code and accept suggestions with `Tab`
3. **Toggle**: `:Copilot enable/disable`

### CodeCompanion
- **Chat interface** for AI assistance
- **Code generation** and explanation
- **Integration** with development workflow

## Troubleshooting

### Plugin Issues
- **Update plugins**: `:PlugUpdate`
- **Clean unused plugins**: `:PlugClean`
- **Check plugin status**: `:PlugStatus`

### Tmux Navigation
- Ensure tmux configuration includes vim-tmux-navigator support
- Check that `Ctrl+H/J/K/L` keys aren't conflicting with other mappings

### LSP Problems
- Verify language servers are installed
- Check `:LspInfo` for configuration status
- Ensure proper PATH configuration for language tools

### Color Issues
- Verify terminal supports 24-bit color
- Check `TERM` environment variable
- Ensure terminal emulator is configured for true color

## Performance Tips

1. **Lazy loading** - Plugins load only when needed
2. **Minimal startup** - Essential plugins only in core configuration
3. **Async operations** - LSP and completion work asynchronously
4. **Treesitter optimization** - Incremental parsing for large files