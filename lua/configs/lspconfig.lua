-- load defaults i.e lua_lsp

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "clangd",
  "cmake",

  "cssls",

  "hls",

  "html",

  "jdtls",

  "lua_ls",

  "pyright",
  "ruff",

  "texlab",
  "tailwindcss"
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

for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end

lspconfig["sqlls"].setup {
  on_attach = function(client, buffnr)
    my_on_attach(client, buffnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = function() return vim.loop.cwd() end,
}

lspconfig["rust_analyzer"].setup {
  on_attach = function(client, buffnr)
    my_on_attach(client, buffnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

lspconfig["ts_ls"].setup {
  on_attach = function(client, buffnr)
    my_on_attach(client, buffnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

lspconfig.volar.setup {
  init_options = {
    typescript = {
      -- replace with your global TypeScript library path
      tsdk = '/home/termint/.nvm/versions/node/v24.0.0/lib/node_modules/typescript/lib'
    }
  }
}
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
