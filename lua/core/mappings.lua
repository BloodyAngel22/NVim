vim.g.mapleader = " "

--VIM
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.cmd([[nnoremap <space>q :q<CR>]])
vim.cmd([[inoremap jj <esc>]])


--NeoTree
vim.cmd([[nnoremap <leader>e :Neotree float<cr>]])

--Buffers
vim.cmd([[nnoremap <silent><space>bb :BufferLinePick<CR>]])
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')

--Comments
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>')
