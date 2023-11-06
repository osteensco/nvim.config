
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<Enter>')
vim.keymap.set({'n', 'i', 'v'}, '<C-_>', '<Cmd>set operatorfunc=CommentOperator<CR>g@')
vim.keymap.set('n', '<leader>gdo', '<Cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gdc', '<Cmd>DiffviewClose<CR>')
vim.keymap.set('n', '<leader>cd', ':cd ')
vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set({'n','v'}, '<leader>y', '\"+y')
vim.keymap.set({'n','v'}, '<leader>Y', '\"+Y')
vim.keymap.set({'n','v'}, '<leader>d', '\"_d')
vim.keymap.set({'n','v'}, '<leader>F', ':%s/\\<<C-r><C-w>\\>//g<left><left>')


vim.keymap.set('n', '<leader>dt', function ()
    local status = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({virtual_text = not status})
end, {desc = '[d]iagnostic [t]oggle for inline text'})


