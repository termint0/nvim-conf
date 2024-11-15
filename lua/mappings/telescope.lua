local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "telescope buffers" })
map("n", "<leader>fd", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "telescope document symbols" })
map("n", "<leader>f.", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope document symbols" })

map("n", "<leader>fmc", "<cmd>Telescope commands<CR>", { desc = "telescope vim commands" })
map("n", "<leader>fmm", "<cmd>Telescope man_pages<CR>", { desc = "telescope man_pages" })
map("n", "<leader>fci", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "telescope incoming calls" })
map("n", "<leader>fco", "<cmd>Telescope lsp_outgoint_calls<CR>", { desc = "telescope outgoint calls" })
