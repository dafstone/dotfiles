-- LSP Configuration
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Go language server (only if gopls is available)
      if vim.fn.executable('gopls') == 1 then
        vim.lsp.config.gopls = {
          cmd = { 'gopls' },
          filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        }
      end

      -- Python language server (only if pylsp is available)
      -- Install with: pip install python-lsp-server
      if vim.fn.executable('pylsp') == 1 then
        vim.lsp.config.pylsp = {
          cmd = { 'pylsp' },
          filetypes = { 'python' },
        }
      end

      -- Lua language server (if available)
      if vim.fn.executable('lua-language-server') == 1 then
        vim.lsp.config.lua_ls = {
          cmd = { 'lua-language-server' },
          filetypes = { 'lua' },
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
              },
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        }
      end

      -- Optional: Add more language servers as needed
      -- TypeScript/JavaScript (if available)
      if vim.fn.executable('typescript-language-server') == 1 then
        vim.lsp.config.ts_ls = {
          cmd = { 'typescript-language-server', '--stdio' },
          filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
        }
      end
    end,
  },
}