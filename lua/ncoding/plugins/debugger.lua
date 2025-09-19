return {
    {
        "microsoft/vscode-js-debug",
        opt = true,
        run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
    },
    {
        "mxsdev/nvim-dap-vscode-js",
        dependencies = {
            "mfussenegger/nvim-dap",
        }
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "microsoft/vscode-js-debug",
        },
        config = function()
            local dap = require("dap")

            require("dap-vscode-js").setup({
                adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
            })

            for _, language in ipairs({ "typescript", "javascript" }) do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require'dap.utils'.pick_process,
                        cwd = "${workspaceFolder}",
                    }
                }
            end

           -- vim.keymap.set("n", "<leader>ds", dap.new) -- start
           -- vim.keymap.set("n", "<leader>dc", dap.continue)
           -- vim.keymap.set("n", "<leader>dn", dap.step_over) -- step over
        end
    }
}
