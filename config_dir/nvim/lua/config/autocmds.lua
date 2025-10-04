-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General autocommands group
local general = augroup("General", { clear = true })

-- Auto reload files when they change externally
autocmd("CursorHold", {
  group = general,
  callback = function()
    vim.cmd("checktime")
  end,
  desc = "Check for file changes",
})

-- Text files configuration
autocmd("FileType", {
  group = general,
  pattern = "text",
  callback = function()
    vim.opt_local.textwidth = 78
  end,
  desc = "Set textwidth for text files",
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Restore cursor position",
})

-- Go-specific autocommands
local go_group = augroup("GoFormat", { clear = true })

autocmd("BufWritePre", {
  group = go_group,
  pattern = "*.go",
  callback = function()
    -- Only format if go.nvim is available
    local ok, go_format = pcall(require, "go.format")
    if ok then
      go_format.goimport()
    end
  end,
  desc = "Auto format Go files on save",
})