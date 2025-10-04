return {
    {
        dir = "~/.config/nvim/lua/ncoding/src/test-runner",
        name = "test-runner",
        depenencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            local test = require("ncoding.src.test-runner");
            test.setup({})
            vim.keymap.set("n", "<leader>rt",function() test.run_test("normal") end, {desc = "run current test file"})
            vim.keymap.set("n", "<leader>rd",function() test.run_test("debug") end, {desc = "run current test file - debug mode"})
        end
    }
}
