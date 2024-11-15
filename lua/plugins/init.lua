return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "leath-dub/snipe.nvim",
    config = function()
      local snipe = require("snipe")
      require("snipe").setup()
      snipe.default_fmt = function(item)
        if item.classifiers:sub(5, 5) == "+" then
          return item.name .. " [m]"
        end
        return item.name
      end
    end,
    opts = {}
  },
  {
    'nvim-java/nvim-java',
    config = false,
  },
  { "nvim-neotest/nvim-nio" },
  {
    'f3fora/nvim-texlabconfig',
    config = function()
      require('texlabconfig').setup(config)
    end,
    -- ft = { 'tex', 'bib' }, -- Lazy-load on filetype
    build = 'go build'
    -- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    'tzachar/local-highlight.nvim',
    event = "VeryLazy",
    config = function()
      require('local-highlight').setup()
    end,
  },
  {
    "kkoomen/vim-doge",
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      -- require("core.utils").load_mappings("dap")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("java").setup()
      require "configs.lspconfig"
    end,
  },
  {
    "frabjous/knap"
  },
  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        'github:nvim-java/mason-registry',
        'github:mason-org/mason-registry',
      },
    },
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        fzf_colors = true
      })
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
    opts = function()
      return require "nvchad.configs.cmp"
    end,
  },
}
