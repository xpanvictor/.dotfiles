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

-- Harpoon
local harpoon = require("harpoon")
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>d", function() harpoon:list():remove() end)
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<C-b>", function() harpoon:list():select(1) end)
map("n", "<C-c>", function() harpoon:list():select(2) end)
map("n", "<C-d>", function() harpoon:list():select(3) end)
map("n", "<C-p>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function() harpoon:list():prev() end)
map("n", "<C-S-N>", function() harpoon:list():next() end)


