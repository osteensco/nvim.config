vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<Enter>')
vim.keymap.set({'n', 'i', 'v'}, '<C-_>', '<Cmd>set operatorfunc=CommentOperator<CR>g@')

