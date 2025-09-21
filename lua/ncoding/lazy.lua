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
    "MunifTanjim/nui.nvim",
    -- useful dependencies end

    -- {'dinhhuy258/vim-local-history', {branch = 'master'}}, // TODO: fails on branch selection 
    require("ncoding.plugins-configs.theme.startup"),
    require("ncoding.plugins-configs.theme.colorscheme"),
    require("ncoding.plugins-configs.treesitter"),
    require("ncoding.plugins-configs.telescope"),
    require("ncoding.plugins-configs.cmp"),
    require("ncoding.plugins-configs.lsp"),
    require("ncoding.plugins-configs.mason"),
    require("ncoding.plugins-configs.project-list"),
    -- require("ncoding.plugins-configs.oil"),
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function()
            local oil = require("oil")

            oil.setup();

            vim.keymap.set("n", "<leader>pv", function()
                oil.open(vim.fn.expand("%:p:h"))-- open oil at current working directory
            end, { desc = "Open Oil in CWD" })

            -- vim.keymap.set("n", "<leader>pv", vim.oil.actions.open_cwd(), { desc = "Open cwd directory" })
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    },

    require("ncoding.plugins-configs.git-integ"),
    -- require("ncoding.plugins.tests"),
    -- require("ncoding.plugins.debugger"),
    require("ncoding.plugins-configs.which-key"),
    -- require("ncoding.plugins.breadcrumbs"),
    require("ncoding.plugins-configs.status_bar"),
    "L3MON4D3/LuaSnip",
})
