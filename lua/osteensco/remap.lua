
vim.g.mapleader = " "

--show keymap help in telescope
vim.keymap.set('n', '<leader>tk', '<Cmd>Telescope keymaps<CR>', {desc="show kemaps"})

--window manipulation
vim.keymap.set('n', '<leader>w', '<C-w>', {desc="window control"})

--Neotree toggle
vim.keymap.set(
    'n', 
    '<leader>nt', 
    function()
        local manager = require("neo-tree.sources.manager")
        local renderer = require("neo-tree.ui.renderer")
        local state = manager.get_state("filesystem")
        local window_exists = renderer.window_exists(state)
        
        if window_exists then
            vim.cmd(':Neotree close')
        else
            vim.cmd(':Neotree') 
        end
    end,
    {desc='Toggles Neotree side bar'}
)

--ctrl+s for saving
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<Enter>', {desc="write current file"})

--ctrl+/ for commenting out lines
vim.keymap.set({'n', 'i', 'v'}, '<C-_>', '<Cmd>set operatorfunc=CommentOperator<CR>g@', {desc="comment/uncomment current line or selection"})
--keymap for wezterm
vim.keymap.set({'n', 'i', 'v'}, '<C-/>', '<Cmd>set operatorfunc=CommentOperator<CR>g@<CR>', {desc="wezterm comment/uncomment current line or selection"})

--git diff open/close
vim.keymap.set('n', '<leader>gdo', '<Cmd>DiffviewOpen<CR>', {desc="[g]it [d]iff [o]pen"})
vim.keymap.set('n', '<leader>gdc', '<Cmd>DiffviewClose<CR>', {desc="[g]it [d]iff [c]lose"})

--cd command
vim.keymap.set('n', '<leader>cd', ':cd ', {desc="populate 'cd' in command mode"})

--paste, text overwritten sent to void buffer
vim.keymap.set('x', '<leader>p', '\"_dP', {desc="paste, anything overwritten sent to void buffer. useful for overwritting multiple times."})

--copy to system clipboard
vim.keymap.set({'n','v'}, '<leader>y', '\"+y', {desc="copy to system clipboard"})
vim.keymap.set({'n','v'}, '<leader>Y', '\"+Y', {desc="copy to system clipboard"})

--delete to void buffer
vim.keymap.set({'n','v'}, '<leader>d', '\"_d', {desc="deletes, contents sent to void buffer"})

--find and replace all
vim.keymap.set({'n','v'}, '<C-L>', ':%s/<C-r><C-w>//g<left><left>', {desc="find and replace all"})

-- inline diagnostic toogle
vim.keymap.set(
    'n',
    '<leader>dt',
    function ()
        local status = vim.diagnostic.config().virtual_text
        vim.diagnostic.config({virtual_text = not status})
    end,
    {desc = '[d]iagnostic [t]oggle for inline text'}
)

-- floating window diagnostic
vim.keymap.set(
'v',
'<leader>dt',
function ()
    vim.diagnostic.open_float(nil, {focus=true, scope="cursor", border="rounded"})
end,
{desc="[d]iagnostic [t]oggle floating window"}
)

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
print(DEFAULTSHELL)
--open shell window below file
openterm = function ()
    vim.cmd('below 8 new')
    vim.cmd.terminal()
end

--ESC to leave insert mode within shell window
vim.cmd.tnoremap('<Esc> <C-\\><C-n>') 

--open shell keymaps
vim.keymap.set('n', '<leader>cmd', openterm, {desc="open system default shell"})
--for some reason venv/scripts/activate doesn't work in cmd.exe on my machine :(
vim.keymap.set('n', '<leader>pwr', function ()
    setshell("powershell.exe")
    openterm()
    setshell(DEFAULTSHELL)
end,
{desc="open powershell (windows only)"}
)




