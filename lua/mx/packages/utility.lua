return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = {}
    },
    {
        "cohama/lexima.vim"
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sharkdp/fd",
            "nvim-treesitter/nvim-treesitter",
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {}
    },
    {
        "folke/which-key.nvim",
        opts = {
            delay = 0
        }
    },
    {
        "Bilal2453/luvit-meta",
        lazy = true
    },
    {
        "onsails/lspkind.nvim"
    }
}
