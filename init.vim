"---Custom startscreen
source $HOME/.config/nvim/startscreen.vim
source $HOME/.config/nvim/mapping.vim

set relativenumber
set number
set encoding=utf-8
set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set complete+=kspell
set completeopt=menuone,longest

packadd termdebug

call plug#begin()

"---Plug-in install

"---File tree
Plug 'preservim/nerdtree'

"---Debugger
Plug 'puremourning/vimspector'

"---Cmake
Plug 'cdelledonne/vim-cmake'

"--Autocomplete
"Plug 'vim-scripts/AutoComplPop'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"--LaTeX
Plug 'lervag/vimtex'

"--Arduino support
"Plug 'stevearc/vim-arduino'

"---Themes install
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'savq/melange-nvim'
Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }

"---Custom startscreen
Plug 'mhinz/vim-startify'

"---LuaLine
Plug 'nvim-lualine/lualine.nvim'

"---Buffer
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

"---OneTerm
Plug 'LoricAndre/OneTerm.nvim'

"---ScrollBar
Plug 'Xuyuanp/scrollbar.nvim'

"---nvim-commaround
Plug 'gennaro-tedesco/nvim-commaround'
"---config
let g:toggle_commaround = 'gcc'

"---Tetris
Plug 'alec-gibson/nvim-tetris'

"---TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"---Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }

call plug#end()

"---Colorscheme init
set termguicolors
colorscheme tokyonight-moon

"---Debugger enable
let g:vimspector_enable_mappings = 'HUMAN'

"---Buffer config
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

"---LaTeX config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let maplocalleader = ""
nmap <F8> <plug>(vimtex-view)

"---NERDTree config

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"---LuaLine
lua << END
require('lualine').setup()
END

"---ScrollBar config
augroup ScrollbarInit
  autocmd!
  autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end

"---TreeSitter config
lua << END
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "cpp", "vim"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
END


"Telescope config
