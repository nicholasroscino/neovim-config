vim.opt.number = true      -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "}", "5k")
vim.keymap.set("n", "{", "5j")
vim.keymap.set("n", "<Meta>2", "<C-W>d")

vim.diagnostic.config({
    jump = { 
        float = true,
    },
})
