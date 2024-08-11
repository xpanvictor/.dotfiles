-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
local servers = { "html", "cssls", "cmake", "tailwindcss", "eslint", "solidity" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- clangd
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- solidity
configs.solidity = {
  default_config = {
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    filetypes = { "solidity" },
    root_dir = lspconfig.util.find_git_ancestor,
    single_file_support = true,
  },
}
-- lspconfig.solidity.setup {
  -- on_attach = on_attach,
-- }

-- -- rust
-- lspconfig.rust_analyzer.setup({
--   on_attach=on_attach,
--   capabilities=capabilities,
--   filetypes={"rust"},
--   root_dir=util.root_pattern("Cargo.toml"),
--   settings={
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true,
--       }
--     }
--   }
-- })
