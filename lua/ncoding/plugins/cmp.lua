return {
    "hrsh7th/nvim-cmp",            -- completion engine
    {
        "hrsh7th/cmp-nvim-lsp",        -- LSP completion source
        config = function()
            -- ~/.config/nvim/lua/myconfig/cmp.lua
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })
        end
    }
}
