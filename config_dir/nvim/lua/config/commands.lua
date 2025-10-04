-- Custom commands
local cmd = vim.api.nvim_create_user_command

-- HTML Tidy (requires tidy on the system)
cmd("Thtml", ":%!tidy -q -i --show-errors 0", {
  desc = "Format HTML using tidy"
})

-- Convenient command to see the difference between the current buffer and the
-- file it was loaded from, thus the changes you made.
cmd("DiffOrig", function()
  vim.cmd([[
    vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
  ]])
end, {
  desc = "Show diff with original file"
})