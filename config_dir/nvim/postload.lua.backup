-- Basic LSP setup using modern vim.lsp.config API
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

-- Completion setup (only if nvim-cmp is available)
local cmp_ok, cmp = pcall(require, 'cmp')
local luasnip_ok, luasnip = pcall(require, 'luasnip')

if not cmp_ok or not luasnip_ok then
  vim.notify("nvim-cmp or LuaSnip not installed - completion disabled", vim.log.levels.WARN)
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Telescope setup (only if telescope is available)
local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
  telescope.setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules", "%.git/", "%.DS_Store", "%.o", "%.a", "%.out", "%.class",
      "%.pdf", "%.mkv", "%.mp4", "%.zip"
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

  -- Load telescope extensions
  pcall(telescope.load_extension, 'fzf')
else
  vim.notify("Telescope not installed - file finding features disabled", vim.log.levels.WARN)
end

-- Treesitter configuration (only if treesitter is available)
local treesitter_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if treesitter_ok then
  treesitter_configs.setup {
  ensure_installed = { "go", "python", "lua", "vim", "vimdoc", "markdown", "javascript", "typescript", "json", "yaml" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
else
  vim.notify("Treesitter not installed - enhanced syntax highlighting disabled", vim.log.levels.WARN)
end

-- CodeCompanion configuration with custom claude_code ACP adapter
local codecompanion_ok, codecompanion = pcall(require, 'codecompanion')
if codecompanion_ok then
  codecompanion.setup({
    adapters = {
      acp = {
        claude_code = function()
          return require("codecompanion.adapters").extend("claude_code", {
            env = {
              url = os.getenv("ANTHROPIC_BASE_URL"),
              api_key = os.getenv("ANTHROPIC_AUTH_TOKEN"),
            },
            schema = {
              model = {
                default = os.getenv("ANTHROPIC_MODEL"), -- vertex-ai-claude-sonnet-4@20250514
                choices = {
                  os.getenv("ANTHROPIC_MODEL"),
                  os.getenv("ANTHROPIC_DEFAULT_HAIKU_MODEL"),
                },
              },
            },
          })
        end,
      },
    },
  })
else
  vim.notify("CodeCompanion not installed - claude_code ACP adapter disabled", vim.log.levels.WARN)
end

-- require'navigator'.setup()

