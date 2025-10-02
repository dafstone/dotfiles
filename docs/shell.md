# Shell Configuration Guide

This repository includes configurations for both Zsh and Bash shells with custom aliases, tools, and integrations.

## Zsh Configuration (.zshrc)

### Theme & Prompt
- **Powerlevel10k** - Modern, fast prompt with git integration
- **Fallback theme**: Robbyrussell (for VS Code integration)
- Custom shell timing functions for performance monitoring

### Plugins Enabled
- `git` - Git command completions and aliases
- `git-flow-avh` - Git flow workflow support
- `macos` - macOS-specific utilities
- `vi-mode` - Vi-style command line editing
- `brew` - Homebrew completions
- `bundler` - Ruby Bundler integration
- `autojump` - Smart directory jumping
- `docker` - Docker completions
- `history-substring-search` - Enhanced history search
- `kubectl` - Kubernetes CLI completions

### Editor Integration
- **Default editor**: Neovim (`/opt/homebrew/bin/nvim`)
- **Vi-mode**: Enabled for command line editing
- Seamless integration with tmux navigation

### History Configuration
- Timestamp format: `mm.dd.yyyy`
- Update check: Weekly
- Completion dots enabled

## Available Aliases

### Git Aliases (from .git_aliases)
Common git shortcuts for faster workflow - see `.git_aliases` for complete list.

### Docker Aliases (from .docker_aliases)
Docker command shortcuts for container management - see `.docker_aliases` for complete list.

### Local Aliases (from .local_aliases)
Personal/machine-specific aliases - see `.local_aliases` for customizations.

## Bash Configuration

### .bash_profile
- Sets up environment variables
- Sources additional configuration files
- Configures PATH and development tools

### .bashrc
- Interactive shell configuration
- Alias definitions
- Command line utilities

## Development Environment

### PATH Configuration
- `/usr/local/bin` prioritized
- Local `~/bin` directory included
- Homebrew paths configured
- Manual path additions for development tools

### Ruby Development
- Bundler integration via oh-my-zsh plugin
- IRB configuration (`.irbrc`) with custom helpers
- Global Gemfile support

### Python Development
- Pyenv integration for version management
- Python 3.11.0 configured for Neovim

### Docker Integration
- Docker completions enabled
- Custom aliases for common operations
- Container management shortcuts

## Navigation Tools

### Autojump
Smart directory navigation - jump to frequently used directories by name:
```bash
j projectname    # Jump to ~/projects/projectname
jo projectname   # Open in file manager
```

### History Search
Enhanced substring search:
- `↑/↓` arrows - Navigate through matching commands
- Type partial command + arrows for smart search

## Terminal Integration

### Tmux Integration
- Seamless pane navigation between shell and tmux
- Shared clipboard configuration
- Window/session management aliases

### Vi-Mode
Command line vi-mode enabled:
- `Esc` - Enter normal mode
- `i/a` - Enter insert mode
- Standard vi navigation in normal mode

## Color & Display

### Terminal Colors
- 256-color support configured
- Custom color schemes for different tools
- Syntax highlighting in various tools

### Status Information
- Git status in prompt (via Powerlevel10k)
- Current directory and path information
- Performance timing (when enabled)

## Environment Variables

Key environment variables set:
- `EDITOR` - Set to Neovim
- `SRC_DIR` - Default source directory
- `MANPATH` - Manual page search path
- Various tool-specific configurations

## Installation & Setup

### Prerequisites
```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### Configuration
1. Link the configuration files:
   ```bash
   ln -sf ~/.dotfiles/.zshrc ~/.zshrc
   ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
   ```

2. Install required tools:
   ```bash
   brew install autojump
   # Follow prompts to complete autojump setup
   ```

3. Configure Powerlevel10k:
   ```bash
   p10k configure
   ```

## Customization

### Adding Personal Aliases
Edit `.local_aliases` for machine-specific customizations that won't be committed to the repository.

### Secret Environment Variables
Create `~/.profile_secrets` for sensitive environment variables (this file is sourced but should not be committed).

### Shell Performance
Use the timing functions to monitor shell startup performance:
```bash
# In .zshrc, set:
show_timings=true
```

## Troubleshooting

### Slow Shell Startup
- Check plugin load times with `show_timings=true`
- Disable unnecessary plugins
- Review PATH modifications

### Completion Issues
- Run `compaudit` to check completion security
- May need to set `ZSH_DISABLE_COMPFIX=true` for some setups

### Vi-Mode Problems
- Check if other plugins conflict with vi-mode
- Verify key bindings with `bindkey` command