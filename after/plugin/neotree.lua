require("neo-tree").setup({

    icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󱧋",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "*",
        highlight = "NeoTreeFileIcon"
    },

    filesystem = {
        filtered_items = {
            hide_hidden = false
        }
    },

    window = {
        mappings = {
            [","] = "navigate_up",
            ["."] = "set_root",
            ["h"] = "toggle_hidden"
        }
    }

})




