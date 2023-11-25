
return {
 
    {
        'nvim-telescope/telescope.nvim', 
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    'tanvirtin/monokai.nvim',
    "cpea2506/one_monokai.nvim",

    {
  	'nvim-lualine/lualine.nvim',
  	requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
    	"nvim-treesitter/nvim-treesitter",
    	build = ":TSUpdate",
    },
    'ThePrimeagen/vim-be-good',

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    'folke/neodev.nvim', 

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',

            'hrsh7th/cmp-nvim-lsp',

        },
    },

    "terrortylor/nvim-comment",

    "sindrets/diffview.nvim",

    {
        "wookayin/semshi",
        build = ":UpdateRemotePlugins",
        version = "*",
        init = function()  
            vim.g["semshi#error_sign"] = false
            vim.g["semshi#simplify_markup"] = false
            vim.g["semshi#mark_selected_nodes"] = false
            vim.g["semshi#update_delay_factor"] = 0.001
        end,
        -- config = function()
        --     any configuration post load
        -- end,
    },


}
