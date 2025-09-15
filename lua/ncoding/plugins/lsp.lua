return {
    "neovim/nvim-lspconfig",
    {
        "pmizio/typescript-tools.nvim",
        config = function()
            local lspconfig = require('lspconfig');
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                filetypes = {"lua"},
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",          -- Neovim uses LuaJIT
                            path = vim.split(package.path, ";"), -- use runtime path
                        },
                        diagnostics = {
                            globals = { "vim" },         -- recognize `vim` global
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true), -- include Neovim runtime
                            checkThirdParty = false,     -- disable annoying third-party prompts
                        },
                        telemetry = {
                            enable = false,              -- disable telemetry
                        },
                    },
                },
            })

--             lspconfig.custom_elements_ls.setup({
--                 filetypes = {
--                     "typescript",
--                     "javascript",
--                     "html",
--                 }
--             })

            require("typescript-tools").setup({
                capabilities = capabilities,
                on_attach = function(_, bufnr)
                    local opts = { buffer = bufnr, noremap = true, silent = true }
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end
    }
}
