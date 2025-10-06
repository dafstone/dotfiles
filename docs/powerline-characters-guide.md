# Powerline Characters Reference Guide

## Overview
This guide covers using the full powerline character set for creating beautiful terminal UI elements like statuslines, prompts, and separators.

## Prerequisites
- **Font**: Powerline-patched font (e.g., MesloLGSNF, Hack Nerd Font, FiraCode Nerd Font)
- **Terminal**: Terminal that supports Unicode and proper font rendering
- **Environment**: Works in tmux, but may need special handling in different applications

## Testing Powerline Support

### Quick Test Command
```bash
# Test if powerline characters render in your terminal
for i in {0..7}; do printf "\uE0B$i "; done && printf "\n"
```

**Expected Output**: You should see 8 distinct characters including triangular separators
**Problem Signs**: Blank spaces, question marks, or replacement characters (�)

### Character Verification
```bash
# Test standard alternatives that usually work
printf "Standard triangles: ▲ ▼ ◀ ▶ ◄ ► ⏴ ⏵ ⮜ ⮞\n"
printf "Block characters: █ ▌ ▐ ▀ ▄ ░ ▒ ▓\n"
```

## Complete Powerline Character Set

### Primary Separators (E0B0-E0B3)
| Unicode | Char | Description | Use Case |
|---------|------|-------------|----------|
| E0B0    | `` | Right triangle (solid) | Main section separator →  |
| E0B1    | `` | Left triangle (solid)  | Main section separator ←  |
| E0B2    | `` | Right triangle (line)  | Sub-section separator →   |
| E0B3    | `` | Left triangle (line)   | Sub-section separator ←   |

### Secondary Separators (E0B4-E0B7)
| Unicode | Char | Description | Use Case |
|---------|------|-------------|----------|
| E0B4    | `` | Right half-circle | Curved separators → |
| E0B5    | `` | Left half-circle  | Curved separators ← |
| E0B6    | `` | Right angle       | Sharp separators →  |
| E0B7    | `` | Left angle        | Sharp separators ←  |

## Configuration Examples

### Lualine (Neovim)
```lua
-- Full-height triangular separators (working solution)
section_separators = { left = '\u{E0B0}', right = '\u{E0B2}' },
component_separators = { left = '\u{E0B1}', right = '\u{E0B3}' },

-- Alternative if Unicode escapes don't work
section_separators = { left = '', right = '' },
component_separators = { left = '', right = '' },
```

### Tmux Powerline
```bash
# In .tmux.conf or tmux-power plugin
# Characters are typically handled by the plugin automatically
set -g @tmux_power_theme 'sky'
```

### Vim-Airline
```vim
" Enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
```

### Shell Prompt (Zsh/Bash)
```bash
# Example powerline-style prompt
PROMPT="%F{blue}%n%f%F{cyan}%f %F{yellow}%~%f %F{green}%f "
```

## Troubleshooting

### Characters Don't Render
1. **Check font**: Ensure you're using a powerline-patched font
2. **Test in terminal**: Run the test command to verify character support
3. **Terminal settings**: Make sure font is set correctly in terminal preferences
4. **Unicode support**: Verify terminal supports Unicode properly

### Characters Show as Spaces/Blanks
- **Issue**: Characters render but are invisible due to color problems
- **Solution**: Use high-contrast themes or custom color schemes
- **Example**: Dark background with light foreground colors

### Different Rendering in Applications
- **tmux vs nvim**: Applications may handle fonts differently
- **Solution**: Test each application separately
- **Fallbacks**: Use standard Unicode triangles (▶ ◀) as alternatives

## Alternative Characters

### If Powerline Doesn't Work
```bash
# Solid triangles (usually work)
▶ ◀ ► ◄

# Angle brackets
❯ ❮ ⟩ ⟨

# Block characters for separation
█ ▌ ▐ ▀ ▄

# Simple separators
│ ┃ ┆ ┊
```

### Character Combinations
```lua
-- Modern clean look
section_separators = { left = '▶', right = '◀' },
component_separators = { left = '│', right = '│' },

-- Minimal style
section_separators = { left = '', right = '' },
component_separators = { left = '│', right = '│' },

-- Bold arrows
section_separators = { left = '❯', right = '❮' },
component_separators = { left = '│', right = '│' },
```

## Theme Considerations

### Color Contrast
Powerline separators need sufficient contrast to be visible:

```lua
-- High contrast theme example
local theme = {
  normal = {
    a = { bg = '#61afef', fg = '#1e222a', gui = 'bold' },
    b = { bg = '#3e4451', fg = '#abb2bf' },
    c = { bg = '#2c323c', fg = '#abb2bf' },
  }
}
```

### Mode-Specific Colors
```lua
insert = { a = { bg = '#98c379', fg = '#1e222a' } },  -- Green
visual = { a = { bg = '#c678dd', fg = '#1e222a' } },  -- Purple
replace = { a = { bg = '#e06c75', fg = '#1e222a' } }, -- Red
```

## Best Practices

1. **Test thoroughly**: Always test in your actual environment
2. **Have fallbacks**: Provide alternative characters if powerline fails
3. **Use Unicode escapes**: `\u{E0B0}` syntax often more reliable than direct characters
4. **High contrast**: Ensure sufficient color contrast for visibility
5. **Document working configs**: Save configurations that work in your environment

## Success Checklist

- [ ] Powerline-patched font installed and configured
- [ ] Test command shows all 8 powerline characters
- [ ] Characters visible in target application (nvim, tmux, etc.)
- [ ] Colors provide sufficient contrast
- [ ] Backup/alternative characters available
- [ ] Configuration committed to version control

---

This guide ensures you can reliably implement powerline-style interfaces across your development environment.