vim.g.mapleader = " " -- Space as leader key
vim.keymap.set("n", "<leader>fl", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "ge",
  function()
    vim.diagnostic.jump({ count = 1 })
  end,
  { desc = "Next Error" }
)

vim.keymap.set("n", "gE",
  function()
    vim.diagnostic.jump({ count = -1 })
  end,
  { desc = "Prev Error" }
)

vim.keymap.set("n", "}", "5k")
vim.keymap.set("n", "{", "5j")

-- comment lines easier
vim.keymap.set("v", "<ESC>Գ", "gc",{silent = true, remap = true})
vim.keymap.set("n", "<ESC>Գ", "gcc",{silent = true, remap = true})


vim.keymap.set("n", "<ESC>Ե", function()
  vim.diagnostic.open_float()
end, { desc = "Open diagnostic under cursor" })

vim.api.nvim_create_user_command("QQ", function()
  vim.cmd(":q|q")
end, {})

vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-\\>", ":belowright split | resize 15 | term<CR>")
-- vim.keymap.set("n", "<F13>", ":Git<CR>")

vim.keymap.set("n", "<Up>", "<C-w>k")
vim.keymap.set("n", "<Down>", "<C-w>j")
vim.keymap.set("n", "<Left>", "<C-w>h")
vim.keymap.set("n", "<Right>", "<C-w>l")
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- <leader>pv opens netrw (file explorer)
vim.keymap.set("n", "<C-n>", "zR")
-- vim.keymap.set("n", "<C-/>", "zM")
vim.keymap.set("n", "<C-l>", "zA")
vim.keymap.set("n", "<C-k>", "zk")
vim.keymap.set("n", "<C-j>", "zj")
