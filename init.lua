require("ncoding.options")
require("ncoding.keymaps")
require("ncoding.lazy")
require("ncoding.string_convert")

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({ timeout = 200 })
    end,
})
