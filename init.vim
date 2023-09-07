"---Custom startscreen
source $HOME/.config/nvim/startscreen.vim
source $HOME/.config/nvim/mapping.vim

set relativenumber
set number
set encoding=utf-8
set noswapfile

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set complete+=kspell
set completeopt=menuone,longest

set clipboard+=unnamedplus

let g:system_copy#copy_command='xclip -sel clipboard'
let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:system_copy_silent = 1
let g:system_copy_enable_osc52 = 1

packadd termdebug

call plug#begin()

"---Plug-in install
Plug 'christoomey/vim-system-copy'

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

"---Telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'

"---Image preview
Plug 'https://github.com/adelarsq/image_preview.nvim'

"---Clang-format
Plug 'rhysd/vim-clang-format'

call plug#end()

"---Colorscheme init
set termguicolors
colorscheme tokyonight-moon
" colorscheme tokyonight-night

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
  ensure_installed = { "cpp", "lua", "vim", "vimdoc" },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },


  highlight = {
    enable = true,

    disable = { "c", "rust" },
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}
END

"--Fzf Plugin
lua << EOF
require('telescope').load_extension('fzf')
EOF

lua << EOF
require("telescope").setup({
  defaults = {
    layout_config = {
      horizontal = {
        preview_cutoff = 0,
      },
    },
  },
})
EOF

