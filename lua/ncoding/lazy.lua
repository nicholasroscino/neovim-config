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

    -- useful dependencies begin -- for dev and other plugins
    "nvim-lua/plenary.nvim",
    "L3MON4D3/LuaSnip",
    "MunifTanjim/nui.nvim",
    -- useful dependencies end

    require("ncoding.plugins-configs.project-list"),
    require("ncoding.plugins-configs.test-runner"),

    require("ncoding.plugins-configs.harpoon"),
    require("ncoding.plugins-configs.theme.startup"),
    require("ncoding.plugins-configs.theme.colorscheme"),
    require("ncoding.plugins-configs.treesitter"),
    require("ncoding.plugins-configs.telescope"),
    require("ncoding.plugins-configs.cmp"),
    require("ncoding.plugins-configs.lsp"),
    require("ncoding.plugins-configs.mason"),
    require("ncoding.plugins-configs.oil"),
    require("ncoding.plugins-configs.git-integ"),
    require("ncoding.plugins-configs.trouble"),
    require("ncoding.plugins-configs.undotree"),
    require("ncoding.plugins-configs.legendary"),
    -- require("ncoding.plugins.tests"),
    -- require("ncoding.plugins.debugger"),
    require("ncoding.plugins-configs.which-key"),
    require("ncoding.plugins-configs.breadcrumbs"),
    require("ncoding.plugins-configs.status_bar"),
})
