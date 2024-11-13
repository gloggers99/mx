local settings = require("mx.settings")
local keymap = require("mx.keymap")

-- bootstrap lazy.nvim for packages and plugins

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- setup base vim settings

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.mouse = "a"

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 3
vim.opt.fillchars = { eob = " " }
vim.opt.background = "dark"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.timeoutlen = 50

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = true
})

-- load lazy

require("lazy").setup({
    spec = {
        { import = "mx.packages" }
    },
    install = { colorscheme = { settings.colorscheme } },
    checker = { enabled = true, notify = false },
    change_detection = { notify = false }
})

-- additional settings that require being set afterward

vim.cmd("colorscheme " .. settings.colorscheme)

-- setup keymap

for _, v in ipairs(keymap) do
    vim.keymap.set(v[1], v[2], v[3])
end

-- setup LSP's

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

