vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.wo.cursorline = true

--if vim.env.DISPLAY then
    vim.opt.clipboard = "unnamedplus"
--end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99 -- :h foldlevelstart -- 99 -> no folds closed
vim.opt.foldnestmax = 4

local virt_lines_ns = vim.api.nvim_create_namespace 'on_diagnostic_jump'

local function on_jump(diagnostic, bufnr)
    if not diagnostic then return end

    vim.diagnostic.show(
        virt_lines_ns,
        bufnr,
        { diagnostic },
        { virtual_lines = { current_line = true }, virtual_text = false }
    )
end

vim.diagnostic.config({
    jump = {
        on_jump = on_jump,
    },
})
