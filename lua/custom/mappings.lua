local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.general = {
  t = {
    ["<C-h>"] = {
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd h")
      end,
      "Window left"
    },
    ["<C-j>"] = {
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd j")
      end,
      "Window down"
    },
    ["<C-k>"] = {
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd k")
      end,
      "Window up"
    },
    ["<C-l>"] = {
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd l")
      end,
      "Window right"
    },
    ["<C-p>"] = {
      "<Up> <CR>",
      "Window right"
    },
  },
  n = {
    ["<leader>sh"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("vert res -" .. vim.v.count)
        else
          vim.cmd("vert res -1")
        end
      end,
      "Vertically narrow window"
    },
    ["<leader>sk"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("res -" .. vim.v.count)
        else
          vim.cmd("res -1")
        end
      end,
      "Vertically narrow window"
    },
    ["<leader>sj"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("res +" .. vim.v.count)
        else
          vim.cmd("res +1")
        end
      end,
      "Vertically narrow window"
    },
    ["<leader>sl"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("vert res +" .. vim.v.count)
        else
          vim.cmd("vert res +1")
        end
      end,
      "Vertically narrow window"
    },
  }
}

return M
