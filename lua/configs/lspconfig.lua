-- load defaults i.e lua_lsp

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "clangd",

  "cssls",

  "hls",

  "html",

  "jdtls",

  "lua_ls",

  "pyright",
  "ruff_lsp",

  "texlab",

  "ts_ls",
}
local nvlsp = require "nvchad.configs.lspconfig"

local my_on_attach = function(client, buffnr)
  nvlsp.on_attach(client, buffnr);
  require("mappings.lsp_overwrite")(buffnr)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = my_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig["sqlls"].setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function() return vim.loop.cwd() end,
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
