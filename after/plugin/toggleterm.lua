require('toggleterm').setup({
    autochdir = true,
    open_mapping = [[<c-\>]],
    shade_terminals = false,
    hide_numbers = true,
    start_in_insert = true,
    direction = 'float',
    persist_size = true,
    persist_mode = true,
    close_on_exit = false,
    float_opts = {
        border = 'double',
        winblend = 0,
        title_pos = 'center',
    },
    highlights = {
        FloatBorder = {
            guifg = '#FF8200',
        },
        -- Normal = {
        --     guibg = '#ffffff',
        -- },
        NormalFloat = {
            link = 'Normal',
        },
    },
})
