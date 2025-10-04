-- dafstone nvim config
-- Migrated to lazy.nvim for better performance and modern Lua configuration

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before loading lazy.nvim
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Import plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
  install = {
    missing = true, -- install missing plugins on startup
    colorscheme = { "aurora" },
  },
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- get a notification when new updates are found
  },
  change_detection = {
    notify = false, -- get a notification when changes are found
  },
})

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.commands")