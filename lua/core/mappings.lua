vim.g.mapleader = " "

--VIM
vim.keymap.set('n', '<leader>w', ':w<CR>')
vim.cmd([[nnoremap <space>q :q<CR>]])
-- vim.cmd([[inoremap jj <esc>]])

--NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
--Buffers
vim.cmd([[nnoremap <silent><space>bb :BufferLinePick<CR>]])
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')

--Comments
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>')
vim.keymap.set('v', '<leader>/', ':CommentToggle<CR>')

--MarkDown Preview
vim.cmd([[nnoremap <leader>md <Plug>MarkdownPreview]])

--CPP-tools
vim.cmd([[vnoremap <leader>cd :TSCppDefineClassFunc<CR>]])

--telescope
-- vim.cmd([[nnoremap <leader>fb :Telescope file_browser<CR>]])
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>cc', ':Telescope colorscheme<CR>')

--
vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
