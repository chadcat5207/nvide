require("plugs.strap")
local lazy = require("lazy")

lazy.setup({
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    lazy = true,
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    config = function() require('plugs.ts.treesitter') end
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    lazy = true
  },
  {
    'NvChad/nvim-colorizer.lua',
    event = 'BufRead',
    config = function() require('plugs.ui.colorizer') end,
    lazy = true
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = 'BufRead',
    config = function() require('plugs.ui.devicons') end,
    lazy = true,
  },

  {
    'kyazdani42/nvim-tree.lua',
    lazy = true,
    cmd = "NvimTreeToggle",
    config = function() require('plugs.util.nvim-tree') end
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", ' ', "'", "`" },
    lazy = true,
    config = function() require('plugs.util.which-key') end
  },
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    lazy = true,
    dependencies = { 'plenary.nvim' },
    config = function() require('plugs.util.telescope') end
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    config = function() require('plugs.util.toggleterm') end,
    cmd = "ToggleTerm",
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufRead" },
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsDeleteLn' },
        },
      }
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    config = function() require('plugs.ui.indentlines') end,
    event = { "BufRead" },
  },
  { "williamboman/mason.nvim",
    cmd = {
      "MasonInstall",
      "MasonUninstall",
      "Mason",
      lazy = true,
      "MasonUninstallAll",
      "MasonLog",
    },
    config = function() require('plugs.lsp.mason') end,
  },
  {
    "terrortylor/nvim-comment",
    config = function() require('plugs.util.comments') end,
    lazy = true,
  },
  -- The funs begins
  {
    "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
    lazy = true,
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspStart" },
    config = function()
      require "plugs.lsp.lspconfig"
    end,
  },

  {
    "utilyre/barbecue.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      attach_navic = true,
      theme = "auto",
      include_buftypes = { "" },
      exclude_filetypes = { "markdown", "gitcommit", "Trouble", "toggleterm" },
      show_modified = false,
    },
  },
  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    lazy = true,
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        lazy = true,
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("plugs.lsp.luasnip")
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        event = "InsertEnter",
        lazy = true,
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
    config = function()
      require("plugs.lsp.cmp")
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    lazy = true,
    event = 'BufRead',
    config = function() require("plugs.lsp.lightbulb") end,
  },
  {
    "LnL7/vim-nix",
    lazy = true,
    ft = 'nix',
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    lazy = true
  },
  {
    'kevinhwang91/nvim-ufo',
    lazy = true,
    event = "BufRead",
    dependencies = 'kevinhwang91/promise-async'
  },
  {
    'simrat39/symbols-outline.nvim',
    cmd = "SymbolsOutline",
    lazy = true,
    config = function() require("plugs.util.symbols") end
  },
  {
    'code-biscuits/nvim-biscuits',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    lazy = true,
    config = function() require("plugs.lsp.biscuits") end,
    event = "BufRead",
  },
  {
    "cbochs/grapple.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    config = function() require("plugs.util.grapple") end,
    cmd = {
      "GrappleCycle",
      "GrapplePopup",
      "GrappleReset",
      "GrappleSelect",
      "GrappleTag",
      "GrappleTags",
      "GrappleToggle",
      "GrappleUntag"
    }
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    lazy = true,
    cmd = {
      "HopAnywhere",
      "HopChar1",
      "HopChar2",
      "HopLine",
      "HopLineStart",
      "HopVertical",
      "HopWord"
    },
    config = function() require("plugs.util.hop") end
  },
  {
    "goolord/alpha-nvim",
    lazy = true,
    cmd = {
      "Alpha",
      "AlphaRedraw"
    },
    config = function()
      require("plugs.ui.alpha")
    end
  }
})
