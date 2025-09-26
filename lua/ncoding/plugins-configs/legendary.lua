return {
    {
        'mrjones2014/legendary.nvim',
        -- since legendary.nvim handles all your keymaps/commands,
        -- its recommended to load legendary.nvim before other plugins
        priority = 10000,
        lazy = false,
        -- sqlite is only needed if you want to use frecency sorting
        -- dependencies = { 'kkharji/sqlite.lua' }
        config = function()
            require('legendary').setup({
                commands = {
                    {
                        ':Format',
                        function()
                            vim.lsp.buf.format();
                        end,
                        description = 'format file',
                    },
                },
            })

            vim.keymap.set("n", "<ESC>Է", ":Legendary<CR>/")
        end
    }
}
