-- Modern statusline with tmux-style full-height separators
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      -- Custom theme for better visual separation like tmux
      local custom_theme = {
        normal = {
          a = { bg = '#61afef', fg = '#1e222a', gui = 'bold' },
          b = { bg = '#3e4451', fg = '#abb2bf' },
          c = { bg = '#2c323c', fg = '#abb2bf' },
          x = { bg = '#2c323c', fg = '#abb2bf' },
          y = { bg = '#3e4451', fg = '#abb2bf' },
          z = { bg = '#61afef', fg = '#1e222a', gui = 'bold' },
        },
        insert = {
          a = { bg = '#98c379', fg = '#1e222a', gui = 'bold' },
          z = { bg = '#98c379', fg = '#1e222a', gui = 'bold' },
        },
        visual = {
          a = { bg = '#c678dd', fg = '#1e222a', gui = 'bold' },
          z = { bg = '#c678dd', fg = '#1e222a', gui = 'bold' },
        },
        replace = {
          a = { bg = '#e06c75', fg = '#1e222a', gui = 'bold' },
          z = { bg = '#e06c75', fg = '#1e222a', gui = 'bold' },
        },
      }

      require("lualine").setup({
        options = {
          theme = custom_theme,
          component_separators = '',
          section_separators = { left = '\u{E0B0}', right = '\u{E0B2}' },
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            {
              'diff',
              colored = true,
              symbols = { added = '+', modified = '~', removed = '-' },
            },
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              symbols = { error = ' ', warn = ' ', info = ' ' },
            },
          },
          lualine_c = {
            {
              'filename',
              file_status = true,
              path = 1,
            }
          },
          lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'nvim-tree' },
      })
    end,
  },
}