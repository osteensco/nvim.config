
vim.g.mapleader = " "

--window manipulation
vim.keymap.set('n', '<leader>w', '<C-w>')

--ctrl+s for saving
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<Enter>')

--ctrl+/ for commenting out lines
vim.keymap.set({'n', 'i', 'v'}, '<C-_>', '<Cmd>set operatorfunc=CommentOperator<CR>g@')

--git diff open/close
vim.keymap.set('n', '<leader>gdo', '<Cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gdc', '<Cmd>DiffviewClose<CR>')

--cd command
vim.keymap.set('n', '<leader>cd', ':cd ')

--paste, text overwritten sent to void buffer
vim.keymap.set('x', '<leader>p', '\"_dP')

--copy to system clipboard
vim.keymap.set({'n','v'}, '<leader>y', '\"+y')
vim.keymap.set({'n','v'}, '<leader>Y', '\"+Y')

--delete to void buffer
vim.keymap.set({'n','v'}, '<leader>d', '\"_d')

--find and replace all
vim.keymap.set({'n','v'}, '<leader>F', ':%s/\\<<C-r><C-w>\\>//g<left><left>')

-- inline diagnostic toogle
vim.keymap.set('n', '<leader>dt', function ()
    local status = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({virtual_text = not status})
end, {desc = '[d]iagnostic [t]oggle for inline text'})


----------------------
--Terminal emulator
----------------------

--identify shell neovim is running in
getcurrshell = function ()
    return vim.o.shell
end
DEFAULTSHELL = getcurrshell()

--set the shell openterm opens
setshell = function (shell)
    vim.o.shell = shell
end

--open shell window below file
openterm = function ()
    vim.cmd('below 8 new')
    vim.cmd.terminal()
end

--ESC to leave insert mode within shell window
vim.cmd.tnoremap('<Esc> <C-\\><C-n>') 

--open shell keymaps
vim.keymap.set('n', '<leader>cmd', openterm)
--for some reason venv/scripts/activate doesn't work in cmd.exe on my machine :(
vim.keymap.set('n', '<leader>pwr', function ()
    setshell("powershell.exe")
    openterm()
    setshell(DEFAULTSHELL)
end)




