"---nvim-commaround
vnoremap <space>/ <Plug>ToggleCommaround


"---Buffer 
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>
nnoremap <silent>bb :BufferLinePick<CR>
nnoremap <silent>cb :BufferLineCloseOthers<CR>


"---NERDTree
nnoremap <space>o :NERDTreeFocus<CR>
nnoremap <space>e :NERDTreeToggle<CR>
" nnoremap <space>ff :NERDTreeFind<CR>


"---Nvim
:nnoremap <space>w :w<CR>
:nnoremap <space>q :q<CR>
:inoremap jj <esc>


"CoC Settings
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"---OneTerm config
nnoremap <F7> :OneTerm term<CR>
nnoremap <space>ff :OneTerm ranger<CR>