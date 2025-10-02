# Neovim Modern Features Guide

This guide covers the core functionality of the modern nvim features added to the configuration.

## 🔤 Autocompletion (nvim-cmp)

### Basic Usage

**Autocompletion appears automatically** as you type. The completion menu shows:
- 🔧 **LSP suggestions** - Functions, variables, methods from language servers
- 📝 **Snippets** - Code templates and patterns
- 📄 **Buffer words** - Text from open files
- 📁 **File paths** - Directory and file name completion

### Key Bindings

| Key | Function |
|-----|----------|
| `Tab` | **Accept completion** or navigate to next item |
| `Shift+Tab` | **Navigate to previous** completion item |
| `Enter` | **Confirm selection** and insert |
| `Ctrl+Space` | **Manually trigger** completion menu |
| `Ctrl+E` | **Dismiss** completion menu |
| `Ctrl+B` | **Scroll documentation** up |
| `Ctrl+F` | **Scroll documentation** down |

### Workflow Examples

```vim
" Typing function names - LSP completion
func<Tab>           " Completes to available functions
myVariable.<Tab>    " Shows available methods/properties

" File path completion
./src/<Tab>         " Shows files in src directory
../config/<Tab>     " Shows files in parent config directory

" Snippet expansion
for<Tab>            " Expands to for loop template
if<Tab>             " Expands to if statement template
```

### Advanced Features

- **Smart case matching** - `str` matches `String`, `strLen`, etc.
- **Fuzzy matching** - `flnm` can match `fileName`
- **Documentation preview** - Hover information in popup
- **Multiple sources** - Combines LSP, snippets, and buffer text

---

## 🔍 File Finding (Telescope)

### Core Functions

**Telescope provides fast, fuzzy file finding and search capabilities.**

### Key Bindings

| Key Combination | Function |
|----------------|----------|
| `Ctrl+P` | **Find files** in current directory |
| `Ctrl+B` | **Browse open buffers** |
| `<leader>fg` | **Live grep** - search text across files |
| `<leader>fh` | **Help tags** - search vim help |

### Using Find Files (`Ctrl+P`)

```bash
# Find files by typing partial names
config          # Finds: .config, config.json, myconfig.py
init            # Finds: init.vim, __init__.py, init.lua
README          # Finds: README.md, README.txt
```

**Features:**
- **Fuzzy matching** - `flnm` matches `file-name.js`
- **Smart filtering** - Ignores node_modules, .git, build artifacts
- **Real-time preview** - See file contents as you navigate
- **Multiple selection** - Select multiple files with `Tab`

### Using Live Grep (`<leader>fg`)

```bash
# Search for text across all files
function setup     # Finds all files containing "function setup"
TODO               # Finds all TODO comments
class.*User        # Regex: finds "class SomeUser", "class UserModel"
```

**Features:**
- **Regex support** - Use patterns like `function.*name`
- **File type filtering** - Search only specific file types
- **Context preview** - See surrounding lines
- **Quick navigation** - Jump directly to matches

### Using Buffer Browser (`Ctrl+B`)

- **See all open files** in a searchable list
- **Quick switching** between buffers
- **Recently used** files appear first
- **Close buffers** directly from the list

### Navigation Within Telescope

| Key | Function |
|-----|----------|
| `↑/↓` or `Ctrl+J/K` | **Navigate** through results |
| `Enter` | **Open file** in current window |
| `Ctrl+X` | **Open in horizontal split** |
| `Ctrl+V` | **Open in vertical split** |
| `Ctrl+T` | **Open in new tab** |
| `Tab` | **Select multiple files** |
| `Escape` | **Close telescope** |

---

## 🎨 Enhanced Syntax Highlighting (Treesitter)

### Automatic Features

**Treesitter provides advanced syntax highlighting and code understanding.**

### Visual Improvements

- **Semantic highlighting** - Functions, variables, and types have distinct colors
- **Context-aware coloring** - Same word colored differently based on context
- **Improved indentation** - Smart auto-indenting based on code structure
- **Better folding** - Code blocks fold more intelligently

### Supported Languages

Currently configured for:
- **Go** - Full syntax support with gopls integration
- **Python** - Enhanced highlighting and indentation
- **Lua** - For nvim configuration editing
- **Vim** - For vimscript files
- **Markdown** - Documentation and README files
- **JavaScript/TypeScript** - Modern JS syntax
- **JSON/YAML** - Configuration files

### Interactive Features

| Key Combination | Function |
|----------------|----------|
| `gnn` | **Start incremental selection** |
| `grn` | **Expand selection** to next node |
| `grc` | **Expand selection** to containing scope |
| `grm` | **Shrink selection** to previous node |

### Incremental Selection Example

```python
# Position cursor on 'name' and use incremental selection
def get_user_name(user_id):
    return users[user_id].name
#                      ^^^^  gnn - selects 'name'
#                ^^^^^^^^^^^  grn - selects 'users[user_id].name'
#   ^^^^^^^^^^^^^^^^^^^^^^^^^  grc - selects entire return statement
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  grc - selects entire function
```

### Code Navigation Benefits

- **Better syntax awareness** - Understanding of function boundaries
- **Improved text objects** - More accurate `vi{`, `va(` operations
- **Smart commenting** - Context-aware comment insertion
- **Enhanced search** - Better pattern matching within code structures

---

## 🔧 Language Server Protocol (LSP)

### Automatic Features

**LSP provides intelligent code assistance when language servers are installed.**

### Available Language Servers

- **Go** - `gopls` (install: `go install golang.org/x/tools/gopls@latest`)
- **Python** - `pylsp` (install: `pip install python-lsp-server`)

### LSP Features (when servers are installed)

- **Error detection** - Syntax and semantic errors highlighted
- **Go to definition** - Jump to function/variable definitions
- **Find references** - See all usages of a symbol
- **Hover documentation** - Function signatures and docs
- **Rename refactoring** - Safe symbol renaming
- **Auto-formatting** - Code formatting on save

### LSP Key Bindings

| Key Combination | Function |
|----------------|----------|
| `gd` | **Go to definition** |
| `gr` | **Find references** |
| `K` | **Hover documentation** |
| `<leader>rn` | **Rename symbol** |
| `<leader>ca` | **Code actions** |
| `<leader>f` | **Format document** |

---

## 🚀 Installation and Setup

### Installing Plugins

1. **Open nvim** and run:
   ```vim
   :PlugInstall
   ```

2. **Install language servers** (optional):
   ```bash
   # Go language server
   go install golang.org/x/tools/gopls@latest

   # Python language server
   pip install python-lsp-server
   ```

3. **Install Telescope dependencies** (for better performance):
   ```bash
   # On macOS
   brew install ripgrep fd

   # Telescope will automatically compile fzf-native
   ```

### First-Time Setup

1. **Run `:PlugInstall`** to install all plugins
2. **Run `:TSUpdate`** to install Treesitter parsers
3. **Restart nvim** to activate all features
4. **Test features**:
   - `Ctrl+P` should open Telescope file finder
   - Typing in insert mode should show completions
   - Opening code files should have enhanced highlighting

### Troubleshooting

**If features don't work:**
- Check `:PlugStatus` for plugin installation issues
- Check `:checkhealth` for system dependencies
- Look for warning messages when opening nvim
- Ensure language servers are in your PATH

**Plugin not found warnings** are normal until `:PlugInstall` is run.

---

## 💡 Tips and Tricks

### Completion Tips
- **Type partial matches** - `str` will show `String`, `struct`, etc.
- **Use Tab liberally** - It's the fastest way to accept completions
- **Learn common snippets** - `for`, `if`, `func` expand to useful templates

### Telescope Tips
- **Use fuzzy matching** - `flnm` finds `file-name.js`
- **Search within results** - Type to filter the telescope results
- **Use live grep for TODO hunting** - `<leader>fg` then type "TODO"

### Treesitter Tips
- **Try incremental selection** - Great for selecting function arguments
- **Notice the improved colors** - Functions vs variables have different highlighting
- **Code folding works better** - `zc` and `zo` to fold/unfold code blocks

### Workflow Integration
- **Start with `Ctrl+P`** to open files quickly
- **Use `Ctrl+B`** to switch between open files
- **Use `<leader>fg`** to search for specific code patterns
- **Let completion guide you** - Discover new functions through LSP suggestions