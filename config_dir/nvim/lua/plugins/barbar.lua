-- Enhanced buffer management with barbar.nvim
return {
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- Git status integration
      "nvim-tree/nvim-web-devicons", -- File icons
    },
    event = "VeryLazy",
    config = function()
      -- Set colorblind-safe highlights for barbar
      vim.api.nvim_set_hl(0, "BufferCurrent", { bg = "#4a9eff", fg = "#1e222a", bold = true }) -- Bright blue (current)
      vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = "#4a9eff", fg = "#1e222a", bold = true })
      vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = "#4a9eff", fg = "#4a9eff" })
      vim.api.nvim_set_hl(0, "BufferInactive", { bg = "#3e4451", fg = "#abb2bf" }) -- Muted background
      vim.api.nvim_set_hl(0, "BufferInactiveMod", { bg = "#3e4451", fg = "#ffab00", italic = true }) -- Orange for modified
      vim.api.nvim_set_hl(0, "BufferInactiveSign", { bg = "#3e4451", fg = "#3e4451" })
      vim.api.nvim_set_hl(0, "BufferVisible", { bg = "#2c323c", fg = "#abb2bf" }) -- Visible but not current
      vim.api.nvim_set_hl(0, "BufferVisibleMod", { bg = "#2c323c", fg = "#ffab00", italic = true })
      vim.api.nvim_set_hl(0, "BufferVisibleSign", { bg = "#2c323c", fg = "#2c323c" })

      require("barbar").setup({
        -- General settings
        animation = true,
        auto_hide = false, -- Always show barbar even with single buffer
        tabpages = true, -- Show tabpage number in the tabline
        clickable = true, -- Enable mouse click support

        -- Visual customization
        icons = {
          filetype = {
            enabled = true, -- Show file type icons
          },
          separator = { left = '▎', right = '' },
          separator_at_end = false,
          modified = { button = '●' },
          pinned = { button = '📌', filename = true },
          preset = 'default',
          alternate = { filetype = { enabled = false } },
          current = { buffer_index = false },
          inactive = { button = '×' },
          visible = { modified = { buffer_number = false } },
        },

        -- Buffer management
        insert_at_end = true, -- Insert new buffers at the end
        maximum_padding = 2,
        minimum_padding = 1,
        maximum_length = 30, -- Max length of buffer name
        minimum_length = 0,

        -- Layout
        semantic_letters = true, -- Use semantic letters for jump-to-buffer
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

        -- Sorting
        sort = {
          ignore_case = false,
        },

        -- Hide certain filetypes
        exclude_ft = { 'help', 'startify', 'qf' },
        exclude_name = { 'package.json' },

        -- Integration with nvim-tree
        sidebar_filetypes = {
          NvimTree = true,
        },
      })
    end,
  },
}