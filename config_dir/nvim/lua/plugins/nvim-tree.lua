-- Modern file explorer replacement for NERDTree
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFile" },
    keys = {
      { "<Leader>n", "<cmd>NvimTreeToggle<CR>", desc = "Toggle nvim-tree" },
      { "<Leader>nf", "<cmd>NvimTreeFindFile<CR>", desc = "Find current file in tree" },
    },
    config = function()
      -- Disable netrw (recommended by nvim-tree)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        -- Show hidden files (like your NERDTree setting)
        filters = {
          dotfiles = false, -- Show dotfiles like NERDTreeShowHidden=1
          git_ignored = false,
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
          highlight_git = true,
        },
        git = {
          enable = true,
          ignore = false,
        },
        actions = {
          open_file = {
            quit_on_open = false,
            resize_window = false,
          },
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}