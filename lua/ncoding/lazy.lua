-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
    "nvim-lua/plenary.nvim", -- useful dependency
    require("ncoding.plugins.theme"),
    require("ncoding.plugins.treesitter"),
    require("ncoding.plugins.telescope"),
    require("ncoding.plugins.cmp"),
    require("ncoding.plugins.lsp"),
    require("ncoding.plugins.mason"),
    require("ncoding.plugins.oil"),
    require("ncoding.plugins.git-integ"),
    require("ncoding.plugins.tests"),
    require("ncoding.plugins.debugger"),
    require("ncoding.plugins.which-key"),
    "L3MON4D3/LuaSnip",
})
