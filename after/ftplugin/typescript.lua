local map = vim.keymap.set

map({ 'n' }, '<leader>la',
  function()
    vim.fn.system("tsc")
  end,
  { desc = "Run main" }
)
