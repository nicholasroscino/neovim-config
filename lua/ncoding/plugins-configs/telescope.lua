return {
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                mode = {"n"},
                desc = "find grep text"
            }
        },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<ESC>Զ", builtin.live_grep, { desc = "Live grep on files" })
            vim.keymap.set("n", "<ESC>Թ", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search grep text" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
            vim.keymap.set("v", "<S-F>", builtin.grep_string, {desc = "Test" })
        end
    }
}
