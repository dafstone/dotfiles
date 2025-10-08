-- Plugin specifications for lazy.nvim
-- Migrated from vim-plug configuration

return {
  -- Colorscheme (load immediately)
  {
    "ray-x/aurora",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("aurora")
    end,
  },

  -- Essential utilities (load immediately)
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  -- UI and appearance
  -- {
  --   "vim-airline/vim-airline",
  --   dependencies = { "vim-airline/vim-airline-themes" },
  --   event = "VeryLazy",
  -- },
  -- {
  --   "vim-airline/vim-airline-themes",
  --   lazy = true,
  -- },

  -- File management
  -- {
  --   "scrooloose/nerdtree",
  --   cmd = { "NERDTree", "NERDTreeToggle", "NERDTreeFind" },
  --   keys = {
  --     { "<Leader>n", ":NERDTree<CR>", desc = "Open NERDTree" },
  --   },
  -- },

  -- Search and navigation
  {
    "mileszs/ack.vim",
    cmd = { "Ack", "AckAdd", "AckFromSearch", "LAck", "LAckAdd", "LackFromSearch" },
  },

  -- Movement and navigation
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },

  -- Text editing
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  -- Git integration
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "iberianpig/tig-explorer.vim",
    cmd = { "Tig", "TigOpenCurrentFile", "TigOpenProjectRootDir", "TigGrep", "TigBlame" },
  },

  -- AI assistance
  {
    "github/copilot.vim",
    event = "InsertEnter",
  },

  -- Markdown
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
  },

  -- Start screen
  {
    "mhinz/vim-startify",
    lazy = false,
  },

  -- Go development
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup()
    end,
  },
  {
    "ray-x/guihua.lua",
    build = "cd lua/fzy && make",
    lazy = true,
  },

  -- Import specialized plugin configurations
  { import = "plugins.lsp" },
  { import = "plugins.completion" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.codecompanion" },
  { import = "plugins.nvim-tree" },
  { import = "plugins.lualine" },
  { import = "plugins.barbar" },
}