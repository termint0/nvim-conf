local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
        return { "--python-executable", virtual .. "/bin/python3" }
      end,
    }),
    null_ls.builtins.hover.dictionary,
  },
})
return ""