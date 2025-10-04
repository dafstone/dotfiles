-- CodeCompanion configuration
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
    },
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionToggle", "CodeCompanionAdd" },
    keys = {
      { "<leader>cc", "<cmd>CodeCompanionToggle<cr>", desc = "Toggle CodeCompanion" },
      { "<leader>ca", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
    },
    config = function()
      require("codecompanion").setup({
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
    end,
  },
}