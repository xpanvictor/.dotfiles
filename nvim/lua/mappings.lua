require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "tt",
  function ()
    require("base46").toggle_transparency()
  end,
  {desc = "Toggle transparency mode"}
)
map('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', { noremap = true, desc = "Add breakpoint at line" })
map('n', '<leader>dr', '<cmd>DapContinue<CR>', { noremap = true, desc = "Start or continue the debugger" })

-- rust crates
map('n', '<leader>rcu', function ()
  require("crates").upgrade_all_crates()
end,
  {desc = "Upgrade all crates"}
)
map('n', '<leader>rco', function ()
  require("crates").open_documentation()
end,
  {desc = "Open documentation",}
)

map('n', '<leader>a', function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  {desc = "Code action rust", }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
