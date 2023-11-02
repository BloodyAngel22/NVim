local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    },
	{
	    "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim",
	    }
	},
	{
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
	},
	{ 'nvim-treesitter/nvim-treesitter' },
	{ 'neovim/nvim-lspconfig' ,
    -- opts = {
    --   inlay_hints = { enabled = true },
    -- },
  },
  {
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'lewis6991/gitsigns.nvim'},

    event = "InsertEnter",
  },
    {
        "williamboman/mason.nvim"
    },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim',
      }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { "jose-elias-alvarez/null-ls.nvim" },
    {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      dependencies = { {'nvim-tree/nvim-web-devicons'}}
    },
	{
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {'terrortylor/nvim-comment'},
    {'edluffy/hologram.nvim'},
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
      "ray-x/lsp_signature.nvim",
      event = "VeryLazy",
      opts = {},
      config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
    { "ggandor/leap.nvim" },
    { "alec-gibson/nvim-tetris" },
    {'mfussenegger/nvim-dap'},
    {'rebelot/kanagawa.nvim'},
    {'onsails/lspkind.nvim'},
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {"mfussenegger/nvim-jdtls"},
    {"rmehri01/onenord.nvim"},
    {
      "iamcco/markdown-preview.nvim",
      config = function()
        vim.fn["mkdp#util#install"]()
      end,
    },
    {"lvimuser/lsp-inlayhints.nvim"},
    {"williamboman/nvim-lsp-installer"},
    { 'smithbm2316/centerpad.nvim' },
    {"xiyaowong/transparent.nvim"},
    {"mg979/vim-visual-multi"},
    {"chxuan/change-colorscheme"},
    {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      config = function()
        require("better_escape").setup()
      end,
    },
    {
      "Badhi/nvim-treesitter-cpp-tools",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
    {
      "Wansmer/treesj",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      keys = {
        {
          "<leader>jj",
          function() require("treesj").toggle() end,
          mode = "n",
          desc = "Toggle Treesitter Unjoin",
        },
        {
          "<leader>js",
          function() require("treesj").split() end,
          mode = "n",
          desc = "Treesitter Split",
        },
        {
          "<leader>jl",
          function()
            require("treesj").join()
          end,
          mode = "n",
          desc = "Treesitter Join Line",
        },
      },
      config = function(_, opts)
        require("treesj").setup(opts)
      end,
      opts = {
        use_default_keymaps = false,
        max_join_length = 220, -- 120 is not sufficient
      },
    },
    { 
      --TAKE
      "folke/twilight.nvim",

      cmd = {
        "Twilight",
        "TwilightEnable",
        "TwilightDisable",
      },

      keys = {
        { "<leader>mt", "<cmd>Twilight<CR>", mode = "n", desc = "Toggle Twilight" },
      },

      opts = {
        dimming = {
          alpha = 0.25, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
          inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 10, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
      exclude = {}, -- exclude these filetypes
    },
  },
      { -- Code runner 
      --TAKE
      "Zeioth/compiler.nvim",
      keys = {
        {
          "<leader>rr",
          ":CompilerOpen<CR>",
          mode = "n",
          desc = "Run Project",
        },
        {
          "<leader>rt",
          ":CompilerToggleResults<CR>",
          mode = "n",
          desc = "Toggle Results",
        },
      },

      cmd = {
        "CompilerOpen",
        "CompilerToggleResults",
        "CompilerRedo",
      },

      dependencies = {
        "stevearc/overseer.nvim",
      },

      opts = {},
    },
    { 'Kasama/nvim-custom-diagnostic-highlight' },
    {
      'rmagatti/goto-preview',
      config = function()
        require('goto-preview').setup {}
      end
    },
    { 'm-demare/hlargs.nvim' },
    {"norcalli/snippets.nvim"},
    {"marko-cerovac/material.nvim"},
    {
      "utilyre/barbecue.nvim",
      name = "barbecue",
      version = "*",
      dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      opts = {
        -- configurations go here
      },
    },
    {"yamatsum/nvim-cursorline"},
    {"yaocccc/nvim-foldsign"},
    {
      "chrisgrieser/nvim-origami",
      event = "BufReadPost", -- later or on keypress would prevent saving folds
      opts = true, -- needed even when using default config
    },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { 'saadparwaiz1/cmp_luasnip' }
})

--Themes

-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme kanagawa-wave")
-- vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme kanagawa-lotus")
-- vim.cmd("colorscheme tokyonight-night")
-- vim.cmd("colorscheme tokyonight-storm")
-- vim.cmd("colorscheme tokyonight-day")
-- vim.cmd("colorscheme tokyonight-moon")
-- vim.cmd("colorscheme catppuccin")
-- vim.cmd("colorscheme catppuccin-latte")
-- vim.cmd("colorscheme catppuccin-frappe")
-- vim.cmd("colorscheme catppuccin-macchiato")
-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd 'colorscheme material'
vim.cmd 'colorscheme material-palenight'
