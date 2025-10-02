# Tmux Configuration Guide

This tmux configuration provides a powerful terminal multiplexer setup with vim-style navigation and advanced scrolling capabilities.

## Quick Reference

### Prefix Key
- **Prefix**: `Ctrl+A` (instead of default Ctrl+B)
- **Send Prefix**: `Ctrl+A` + `A` (for nested tmux sessions)

## 🔄 Scrolling & History Navigation

### Fast Keyboard Scrolling (NEW!)
These bindings work from normal mode and automatically enter copy mode:

| Key Combination | Action |
|----------------|--------|
| `Page Up` | Enter copy mode and scroll up one page |
| `Page Down` | Enter copy mode and scroll down one page |
| `Ctrl+A` + `Ctrl+U` | Enter copy mode and scroll up half page |
| `Ctrl+A` + `Ctrl+D` | Enter copy mode and scroll down half page |
| `Shift+Page Up` | Alternative page up scrolling |
| `Shift+Page Down` | Alternative page down scrolling |

### Scrolling While Selecting Text
These work in copy mode and preserve your text selection:

| Key Combination | Action |
|----------------|--------|
| `Page Up/Down` | Full page scrolling in copy mode |
| `Ctrl+U/D` | Half-page scrolling (only works in copy mode) |
| `Ctrl+B/F` | Alternative page scrolling (vi-style) |
| `Ctrl+Y` | Scroll up one line |
| `Ctrl+E` | Scroll down one line |
| `Home/End` | Jump to start/end of current line |

### Copy Mode Access
| Key Combination | Action |
|----------------|--------|
| `Escape` | Enter copy mode |
| `Ctrl+[` | Alternative way to enter copy mode |
| `p` | Paste buffer |

### Mouse Scrolling
- **Mouse wheel**: Scroll through history
- **Ctrl+Mouse wheel**: Half-page scrolling

## 🪟 Window Management

### Window Operations
| Key Combination | Action |
|----------------|--------|
| `Ctrl+A` + `n` | Create new window in home directory |
| `Ctrl+A` + `Tab` | Next window |
| `Ctrl+A` + `m` | Choose window from list |
| `Ctrl+A` + `t` | Toggle status bar |

### Window Selection (Function Keys)
| Key | Action |
|-----|--------|
| `Ctrl+F1-F12` | Select window 1-12 directly |

## 🔲 Pane Management

### Pane Creation
| Key Combination | Action |
|----------------|--------|
| `Ctrl+A` + `|` | Split window horizontally (vertical pane) |
| `Ctrl+A` + `-` | Split window vertically (horizontal pane) |
| `Ctrl+A` + `c` | Kill current pane |

### Pane Navigation (Vim-style)
| Key Combination | Action |
|----------------|--------|
| `Ctrl+A` + `h` | Move to left pane |
| `Ctrl+A` + `j` | Move to pane below |
| `Ctrl+A` + `k` | Move to pane above |
| `Ctrl+A` + `l` | Move to right pane |
| `Ctrl+A` + `Space` | Cycle through pane layouts |

### Pane Selection (Function Keys)
| Key | Action |
|-----|--------|
| `Ctrl+A` + `F1-F11` | Select pane 1-11 directly |

### Pane Resizing
| Key Combination | Action |
|----------------|--------|
| `Ctrl+A` + `↑` | Resize pane up by 15 lines |
| `Ctrl+A` + `↓` | Resize pane down by 15 lines |
| `Ctrl+A` + `←` | Resize pane left by 15 columns |
| `Ctrl+A` + `→` | Resize pane right by 15 columns |

## 🔗 Vim Integration

### Seamless Navigation
These keys work both in tmux and vim for unified navigation:

| Key | Action |
|-----|--------|
| `Ctrl+H` | Move left (tmux pane or vim window) |
| `Ctrl+J` | Move down (tmux pane or vim window) |
| `Ctrl+K` | Move up (tmux pane or vim window) |
| `Ctrl+L` | Move right (tmux pane or vim window) |

The configuration automatically detects if you're in vim and sends the keys to vim instead of tmux.

## 🛠️ Utility Commands

### Session Management
| Key Combination | Action |
|----------------|--------|
| `Ctrl+A` + `r` | Reload tmux configuration |

### Quick Launch
| Key Combination | Action |
|----------------|--------|
| `Ctrl+A` + `/` | Open man page in new pane |
| `Ctrl+A` + `v` | Open vim with file in new pane |
| `Ctrl+A` + `s` | SSH to host in new window |

## 🎨 Visual Configuration

### Color Scheme
- Solarized-inspired color scheme
- Active pane highlighted with bright green border
- Status bar with black background and yellow text
- Active window highlighted in bright red

### Status Bar
- Custom colors and styling
- Window activity monitoring
- Automatic window renaming

## ⚙️ Advanced Settings

### Performance
- History limit: 50,000 lines
- Escape time: 1ms (fast key response)
- Aggressive resize: disabled
- Mouse support: enabled

### Copy Mode
- Vi-style key bindings in copy mode
- Integration with macOS clipboard via `reattach-to-user-namespace`
- Custom selection and copy bindings

### Window Numbering
- Windows start at index 1 (not 0)
- Panes start at index 1 (not 0)
- Automatic window renumbering when windows are closed

## 🔧 Configuration File Location

The configuration is stored in `~/.tmux.conf`. To reload after making changes:

```bash
# From within tmux
Ctrl+A + r

# From command line
tmux source-file ~/.tmux.conf
```

## Tips & Tricks

1. **Fast History Search**: Enter copy mode (`Escape`) then use `/` to search backwards or `?` to search forwards
2. **Copy to System Clipboard**: Select text in copy mode, then press `y` to copy to macOS clipboard
3. **Multiple Selection**: Use `v` to start selection, move cursor, then `y` to copy
4. **Zoom Pane**: `Ctrl+A + z` to zoom current pane to full window (toggle)
5. **Detach Session**: `Ctrl+A + d` to detach and keep session running
6. **Ctrl+U/D Work Normally**: These keys now work normally in shell and vim, only scroll in tmux copy mode
7. **Manual Scrolling**: Use `Ctrl+A` + `Ctrl+U/D` when you need to scroll from normal mode

## Troubleshooting

### Copy/Paste Issues on macOS
If copy/paste isn't working, ensure you have `reattach-to-user-namespace` installed:
```bash
brew install reattach-to-user-namespace
```

### Vim Navigation Not Working
Make sure your vim configuration includes the tmux-navigator plugin or compatible key bindings.

### Mouse Not Working
Ensure you're using tmux 2.1+ for proper mouse support. Older versions may need different mouse configuration.