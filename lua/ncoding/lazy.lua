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
  require("ncoding.plugins-configs.helpers.legendary"),

  -- useful dependencies begin -- for dev and other plugins
  "nvim-lua/plenary.nvim",
  "L3MON4D3/LuaSnip",
  "MunifTanjim/nui.nvim",
  -- useful dependencies end

  require("ncoding.plugins-configs.ui.theme.project-list"),
  require("ncoding.plugins-configs.test-runner"),

  require("ncoding.plugins-configs.ui.theme.startup"),
  require("ncoding.plugins-configs.ui.theme.colorscheme"),
  require("ncoding.plugins-configs.ui.breadcrumbs"),
  require("ncoding.plugins-configs.ui.status_bar"),

  -- require("ncoding.plugins-configs.helpers.which-key"),
  require("ncoding.plugins-configs.helpers.harpoon"),
  require("ncoding.plugins-configs.helpers.trouble"),

  require("ncoding.plugins-configs.core.treesitter"),
  require("ncoding.plugins-configs.core.telescope"),
  require("ncoding.plugins-configs.core.cmp"),
  require("ncoding.plugins-configs.core.lsp"),
  require("ncoding.plugins-configs.core.mason"),
  require("ncoding.plugins-configs.core.oil"),
  require("ncoding.plugins-configs.core.git-integ"),
  require("ncoding.plugins-configs.core.undotree"),

  --
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  --


  require("ncoding.plugins-configs.debugger"),
  -- put here al the plugins configs you don't want to be publicly available
  require("ncoding.plugins-configs.private")
})
