return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } }
            }
        }
    },
    {
        "saghen/blink.cmp",
        lazy = false,
        dependencies = "rafamadriz/friendly-snippets",
        version = "v0.*",
        opts = {
            sources = {
                completion = {
                    enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" },
                },
                providers = {
                    lsp = { fallback_for = { "lazydev" } },
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" }
                }
            },
            keymap = { preset = "enter" },
            highlight = {
                use_nvim_cmp_as_default = true
            },
            nerd_fonts_variant = "mono",
            accept = { auto_brackets = { enabled = true } },
            trigger = { signature_help = { enabled = true } }
        },
        opts_extend = { "sources.completion_enabled_providers" }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp"
        },
        config = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.server or {}) do
                config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    }
}
