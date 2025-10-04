-- Keymaps
local keymap = vim.keymap.set

-- General mappings
keymap("n", "Q", "gq", { desc = "Formatting" })
keymap("i", "<C-U>", "<C-G>u<C-U>", { desc = "Delete line in insert mode" })

-- Leader key mappings
keymap("n", "<Leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
keymap("n", "<Leader>nf", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in tree" })
keymap("n", "<Leader>/", ":noh<CR>", { desc = "Clear search highlights" })
keymap("n", "<Leader>q", ":tabp<CR>", { desc = "Previous tab" })
keymap("n", "<Leader>]", ":tabn<CR>", { desc = "Next tab" })
keymap("n", "<Leader>[", ":tabn<CR>", { desc = "Next tab" })
keymap("n", "<Leader>t", ":ToggleTagbar<CR>", { desc = "Toggle Tagbar" })
keymap("n", "<Leader>v", ":luafile ~/.dotfiles/config_dir/nvim/init.lua<CR>", { desc = "Reload nvim config" })
keymap("n", "<Leader>j", ":%!python -m json.tool<CR>", { desc = "Format JSON" })

-- Telescope mappings (will work when telescope loads)
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<C-b>", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- Copy to system clipboard (macOS specific)
keymap("v", "<C-x>", ":!reattach-to-user-namespace pbcopy<CR>", { desc = "Cut to clipboard" })
keymap("v", "<C-c>", ":w !reattach-to-user-namespace pbcopy<CR><CR>", { desc = "Copy to clipboard" })

-- Search and replace visual selection
keymap("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', { desc = "Search and replace selection" })

-- Insert mode completion (for compatibility)
keymap("i", "<expr><TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', { expr = true, desc = "Tab completion" })