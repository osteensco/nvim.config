vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<Enter>')
vim.keymap.set({'n', 'i', 'v'}, '<C-_>', '<Cmd>set operatorfunc=CommentOperator<CR>g@')
vim.keymap.set('n', '<leader>dvo', '<Cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>dvc', '<Cmd>DiffviewClose<CR>')
vim.keymap.set('n', '<leader>cd', ':cd ')
vim.keymap.set('n', '<leader>dt', function ()
    local status = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({virtual_text = not status})
end, {desc = '[d]iagnostic [t]oggle for inline text'})


