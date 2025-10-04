-- local function define_signs()
--     -- Define the three signs using the same characters and highlight groups
--     vim.fn.sign_define('DapBreakpoint', {
--         text = 'AB', -- Breakpoint marker
--         texthl = 'DapBreakpoint',
--     })
-- 
--     vim.fn.sign_define('DapStopped', {
--         text = '➜', -- Execution pointer marker
--         texthl = 'DapStopped',
--         linehl = 'DapStoppedLine', -- Highlights the entire line
--     })
-- 
--     vim.fn.sign_define('DapConditional', {
--         text = '◆', -- Conditional breakpoint marker
--         texthl = 'DapConditional',
--     })
-- 
--     -- Define highlight groups for colors/styles
--     vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#E55561', bold = true })
--     vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98C379', bold = true, bg = 'none' })
--     vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#3E4452' })
--     vim.api.nvim_set_hl(0, 'DapConditional', { fg = '#FABD2F', bold = true })
-- 
--     print("DAP Signs defined.")
-- end

-- define_signs()
-- 
-- local current_buf = vim.api.nvim_get_current_buf()
-- local sign_group = 'DapTestGroup' -- A unique group name
-- 
--     -- Place a normal breakpoint at line 5 (ID 1)
-- vim.fn.sign_place(1, sign_group, 'DapBreakpoint', current_buf, {lnum = 35, priority = 1000})

return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    {
        "mfussenegger/nvim-dap",
    },
}
