local map = vim.keymap.set
local unmap = vim.keymap.del

return function(buffnr)
  map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "telescope document symbols", buffer = buffnr })
  map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "telescope definition", buffer = buffnr })
  map("n", "gtd", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "telescope type definition", buffer = buffnr })

  -- unmap({ "n", "v" }, "<leader>ca", {buffer = buffnr})
  map({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, { desc = "Code Actions", buffer = buffnr })
end
