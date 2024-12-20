require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<Tab>"] = "move_selection_next",
                ["<S-Tab>"] = "move_selection_previous",
                ["<C-a>"] = "add_selection",
                ["<C-r>"] = "remove_selection",
            },
        }
    }
})

local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>tff', builtin.find_files, {desc = '[t]elescope [f]ind [f]iles, looks at all files'})
vim.keymap.set('n', '<leader>tf', builtin.git_files,
    { desc = '[t]elescope project [f]iles, looks at files within git repo' })
vim.keymap.set('n', '<leader>ts', function()
        builtin.grep_string({ search = "" })
    end,
    { desc = '[t]elescopt project [s]earch, takes a string a searches for it in files within git repo' })
vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = '[t]elescope [d]iagnostics' })
