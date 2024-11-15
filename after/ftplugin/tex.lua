local map = vim.keymap.set

map(
  { 'n' }, '<leader>la',
  function()
    require("knap").toggle_autopreviewing()
  end,
  { desc = "Toggle latex autopreview" }
) -- F5 processes the document once, and refreshes the view

-- F6 closes the viewer application, and allows settings to be reset
map({ 'n' }, '<leader>lx', function() require("knap").close_viewer() end,
  { desc = "Close latex preview" }
)

-- F7 toggles the auto-processing on and off
map({ 'n' }, '<leader>ll', function() require("knap").process_once() end,
  { desc = "Latex preview" }
)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
map({ 'n' }, '<leader>lj', function() require("knap").forward_jump() end,
  { desc = "Latex preview forward jump" }
)

