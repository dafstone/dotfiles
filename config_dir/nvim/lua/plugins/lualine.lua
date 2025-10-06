-- Modern statusline with clean separators that actually work
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = 'auto',
          component_separators = { left = '│', right = '│' },
          section_separators = { left = '', right = '' },
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