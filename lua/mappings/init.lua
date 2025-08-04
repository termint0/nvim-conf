require "nvchad.mappings"
require("mappings.telescope")

local map = vim.keymap.set
local unmap = vim.keymap.del

-- unmap("n", "<leader>rn")

-- unmap("n", "<leader>cc")
-- unmap("n", "<leader>ch")
-- unmap("n", "<leader>cm")

vim.cmd("map <C-t> <Nop>")
vim.cmd("map K <Nop>")

map("n", "<leader>e", vim.diagnostic.open_float, bufopts)

map('n', '<Leader>gd', require('neogen').generate)



map({ "n", "v" }, "<S-h>", function()
require("snipe").open_buffer_menu()
end, { desc = "Open Snipe buffer menu" }
)
-- map("n", "<S-h>", "<cmd>Telescope buffers<CR>", { desc = "telescope buffers" })

map({ "n", "v" }, "<leader>x", function()
  local buf = vim.api.nvim_get_current_buf()
  if vim.api.nvim_buf_get_option(buf, "modified") then
    local choice = vim.fn.confirm("Buffer has unsaved changes. Close anyway?", "&Yes\n&No", 2)
    if choice ~= 1 then
      return
    end
  end
  vim.cmd("bd! " .. tostring(buf))
end
)


local wrap_inlay_hint = function(foo, buffnr)
  return function()
    foo(not vim.lsp.inlay_hint.is_enabled(), { buffnr = buffnr })
  end
end

map("n", "<leader>i", wrap_inlay_hint(vim.lsp.inlay_hint.enable, buffnr), { desc = "Format current buffer" })


local wrap_format = function(foo, buffnr)
  return function()
    foo({ buffnr = buffnr })
  end
end
map("n", "<leader>v", wrap_format(vim.lsp.buf.format, buffnr), { desc = "Format current buffer" })
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
map("n", "K", vim.lsp.buf.hover, { desc = "Terminal Escape terminal mode" })

map("t", "<C-h>",
  function()
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
    vim.cmd("wincmd h")
  end,
  { desc = "Window left" }
)

map("t", "<C-l>",
  function()
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
    vim.cmd("wincmd j")
  end,
  { desc = "Window right" }
)
map("t", "<C-j>",
  function()
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
    vim.cmd("wincmd j")
  end,
  { desc = "Window down" }
)
map("t", "<C-k>",
  function()
    vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
    vim.cmd("wincmd k")
  end,
  { desc = "Window up" }
)
