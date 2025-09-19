vim.g.mapleader = " " -- Space as leader key
vim.keymap.set("n", "<leader>fl", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "ge",
    function()
        vim.diagnostic.jump({ count = 1 })
    end,
    {desc = "Next Error" }
)

vim.keymap.set("n", "gE",
    function()
        vim.diagnostic.jump({ count = -1 })
    end,
    {desc = "Prev Error" }
)

vim.keymap.set("n", "<F13>", ":Git<CR>")
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <leader>pv opens netrw (file explorer)
