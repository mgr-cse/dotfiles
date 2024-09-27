-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "pyright", "zls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- zig
--lspconfig.zls.setup({
--  capabilities = capabilities,
--  on_attach = on_attach,
--  cmd = { "zls" },
--  filetypes = { "zig", "zir" },
--  root_dir = lspconfig.util.root_pattern("zls.json", "build.zig", ".git"),
--  single_file_support = true,
--})
--
