
local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>tff', builtin.find_files, {desc = '[t]elescope [f]ind [f]iles, looks at all files'})
vim.keymap.set('n', '<leader>tf', builtin.git_files, {desc = '[t]elescope project [f]iles, looks at files within git repo'})
vim.keymap.set('n', '<leader>ts', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {desc = '[t]elescopt project [s]earch, takes a string a searches for it in files within git repo'})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {desc = '[t]elescope [d]iagnostics'})






