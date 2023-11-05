
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tff', builtin.find_files, {desc = '[t]elescope [f]ind [f]iles, looks at all files'})
vim.keymap.set('n', '<leader>tpf', builtin.git_files, {desc = '[t]elescope [p]roject [f]iles, looks at files within git repo'})
vim.keymap.set('n', '<leader>tps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = '[p]roject search, takes a string a searches for it in files within git repo'})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {desc = '[t]elescope [d]iagnostics'})






