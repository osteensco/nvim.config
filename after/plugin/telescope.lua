
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = '[f]ind [f]iles, looks at all files'})
vim.keymap.set('n', '<leader>pf', builtin.git_files, {desc = '[p]roject [f]iles, looks at files within git repo'})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = '[p]roject search, takes a string a searches for it in files within git repo'})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {desc = '[t]elescope [d]iagnostics'})






