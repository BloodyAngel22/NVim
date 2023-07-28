"---nvim-commaround
vnoremap <space>/ <Plug>ToggleCommaround


"---Buffer 
nnoremap <silent><space>bb :BufferLinePick<CR>
nnoremap <silent>cb :BufferLineCloseOthers<CR>


"---NERDTree
nnoremap <space>o :NERDTreeFocus<CR>
nnoremap <space>e :NERDTreeToggle<CR>


"---Nvim
:nnoremap <space>w :w<CR>
:nnoremap <space>q :q<CR>
:inoremap jj <esc>


"CoC Settings
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"---OneTerm config
nnoremap <F7> :OneTerm term<CR>

"---Telescope
nnoremap <space>ff <cmd>Telescope find_files<cr>
nnoremap <space>fb <cmd>Telescope buffers<cr>
nnoremap <space>fg <cmd>Telescope live_grep<cr>
