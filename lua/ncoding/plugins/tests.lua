return {
    {
        "google/executor.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            local executor = require("executor")
            executor.setup({})

            vim.keymap.set("n", "<leader>rt", function()
                --executor.commands.set_command("npm run test $E_FN")
                executor.commands.run()
                executor.commands.show_detail()
            end)
        end,
    },
}
