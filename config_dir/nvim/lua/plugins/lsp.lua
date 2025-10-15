-- LSP Configuration using uv-managed Python and tools
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Use new vim.lsp.config API (Neovim 0.11+)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Python language server - Use uv-managed pylsp
      if vim.fn.executable('pylsp') == 1 then
        vim.lsp.config.pylsp = {
          cmd = { 'pylsp' },
          capabilities = capabilities,
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = true },
                pylint = { enabled = false },
                jedi_completion = { enabled = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true },
              },
            },
          },
        }
        vim.lsp.enable('pylsp')
      end

      -- Go language server (only if gopls is available)
      if vim.fn.executable('gopls') == 1 then
        vim.lsp.config.gopls = {
          capabilities = capabilities,
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        }
        vim.lsp.enable('gopls')
      end

      -- Lua language server (if available)
      if vim.fn.executable('lua-language-server') == 1 then
        vim.lsp.config.lua_ls = {
          capabilities = capabilities,
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
        vim.lsp.enable('lua_ls')
      end

      -- TypeScript/JavaScript (if available)
      if vim.fn.executable('typescript-language-server') == 1 then
        vim.lsp.config.ts_ls = {
          capabilities = capabilities,
        }
        vim.lsp.enable('ts_ls')
      end

      -- LSP key mappings (set when LSP attaches)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer local mappings
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })
    end,
  },
}