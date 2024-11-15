local map = vim.keymap.set

local function is_client_attached(name)
  for _, client in pairs(vim.lsp.buf_get_clients()) do
    if client.name == name then
      return true
    end
  end
  return false
end

local function start ()
  if not is_client_attached("jdtls") then
    return nil
  end
  require("java").runner.built_in.run_app({})
end

map({ 'n' }, '<leader>la',
  start,
  { desc = "Run main" }
)

map({ 'n' }, '<leader>lb',
  "<cmd>JavaBuildBuildWorkspace<CR>",
  { desc = "Build workspace" }
)

map({ 'n' }, '<leader>lcb',
  "<cmd>JavaBuildCleanWorkspace<CR>",
  { desc = "Build clean workspace" }
)

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

local function extract_dirs()
    local full_path = vim.fn.expand('%:p')  -- Get full path of the current file
    local after_src = full_path:match(".*/src/(.+)/[^/]+$")  -- Capture all directories after 'src', exclude filename
    if after_src then
        -- Replace '/' with '.' in the captured directories
        return after_src:gsub("/", ".")
    else
        return ""  -- In case 'src' isn't in the path
    end
end

ls.add_snippets("all", {
    s("package", {
        t("package "),
        f(extract_dirs, {}),  -- Calls the `greeting` function and inserts its result
        t(";")
    }),
})
