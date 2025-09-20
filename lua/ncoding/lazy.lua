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

local projectPath = os.getenv("NVIM_PROJECT_PATH")

-- Load plugins
require("lazy").setup({
    "nvim-lua/plenary.nvim", -- useful dependency
    -- {'dinhhuy258/vim-local-history', {branch = 'master'}}, // TODO: fails on branch selection 
    require("ncoding.plugins.theme.startup").setup(projectPath),
    require("ncoding.plugins.theme.colorscheme"),
    require("ncoding.plugins.treesitter"),
    require("ncoding.plugins.telescope"),
    require("ncoding.plugins.cmp"),
    require("ncoding.plugins.lsp"),
    require("ncoding.plugins.mason"),
    require("ncoding.plugins.oil"),
    require("ncoding.plugins.git-integ"),
    -- require("ncoding.plugins.tests"),
    -- require("ncoding.plugins.debugger"),
    require("ncoding.plugins.which-key"),
    -- require("ncoding.plugins.breadcrumbs"),
    require("ncoding.plugins.status_bar"),
    "L3MON4D3/LuaSnip",
})
