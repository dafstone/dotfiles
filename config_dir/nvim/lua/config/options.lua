-- Options
local opt = vim.opt

-- General
opt.mouse = "a"                     -- Enable mouse support
-- opt.encoding = "utf-8"           -- Not settable in Neovim (always UTF-8)
opt.fileencoding = "utf-8"          -- Force UTF-8 file encoding

-- Terminal settings (crucial for powerline fonts)
vim.opt.termguicolors = true        -- Enable 24-bit RGB colors
vim.g.airline_powerline_fonts = 1   -- Enable powerline fonts in airline
vim.g.airline_theme = "luna"        -- Set airline theme

-- Appearance
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Show relative line numbers
opt.title = true                    -- Set the terminal title
opt.laststatus = 2                  -- Always show statusline
opt.showcmd = true                  -- Show incomplete commands
opt.showmode = true                 -- Display the mode
opt.ruler = true                    -- Show cursor position

-- Search
opt.ignorecase = true               -- Case insensitive search
opt.smartcase = true                -- Case sensitive if uppercase present
opt.incsearch = true                -- Incremental search
opt.hlsearch = true                 -- Highlight search matches

-- Indentation
opt.autoindent = true               -- Auto indent on new line
opt.tabstop = 2                     -- Tab width
opt.shiftwidth = 2                  -- Indent width
opt.expandtab = true                -- Use spaces instead of tabs

-- Files and buffers
opt.autoread = true                 -- Auto reload files changed outside vim
opt.hidden = true                   -- Handle multiple buffers better
opt.backup = false                  -- No backup files
opt.swapfile = false                -- No swap files
opt.history = 50                    -- Command history

-- Editing
opt.backspace = { "indent", "eol", "start" }  -- Better backspacing

-- Python host program (pyenv integration)
vim.g.python3_host_prog = "/Users/dan.stone/.pyenv/versions/3.11.0/bin/python3"

-- Colorscheme settings
vim.g.aurora_italic = 1
vim.g.aurora_transparent = 1
vim.g.aurora_bold = 1
vim.g.aurora_darker = 1

-- Airline theme (moved to terminal settings section above)

-- NERDTree settings (now using nvim-tree)
-- vim.g.NERDTreeShowHidden = 1

-- Ack.vim configuration
if vim.fn.executable("ag") == 1 then
  vim.g.ackprg = "ag --vimgrep"
end

-- vim-markdown configuration
vim.g.vim_markdown_folding_disabled = 1

-- Disable legacy filetype handling
vim.g.loaded_matchit = 1