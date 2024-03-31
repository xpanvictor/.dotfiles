local dap = require "dap"

dap.configurations.cpp = {
    {
      name = "Launch",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      runInTerminal = true,
    },
  }


local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local codelldb_path = codelldb:get_install_path() .. "/extension/lldb/bin/lldb"

dap.adapters.codelldb = {
    id = "codelldb",
    type = "executable",
    command = codelldb_path,
}
