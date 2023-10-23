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
  })

--Themes

vim.cmd("colorscheme kanagawa")
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
