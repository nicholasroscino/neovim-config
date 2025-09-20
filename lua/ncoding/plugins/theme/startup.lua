local M = {};

function M.setup(projectsRoot)
    return {
        {
            "startup-nvim/startup.nvim",
            dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
            config = function()
                local hhmm = os.date("%H:%M")
                local date = os.date("%d-%m-%y")

                local proj = {}
                local projectFindCommand = [[ls -la $projectsRoot | awk '$9 != "" && $9 != "." && $9 != ".." {print $9}']]

                local execCommand = (projectFindCommand:gsub('$(%w+)', { projectsRoot = projectsRoot }))
                for dir in io.popen(execCommand):lines() do
                    local joinPath = projectsRoot .. "/" .. dir
                    table.insert(proj, {dir, "lua require('ncoding.plugins.theme.project-cd').moveToProject('" .. joinPath .. "')", "-"});
                end

                require("startup").setup({
                    header = {
                        type = "text",
                        oldfiles_directory = false,
                        align = "center",
                        fold_section = false,
                        title = "Header",
                        margin = 0,
                        content ={
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣶⣶⣿⣿⣿⣿⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⣠⣼⣿⣿⣿⣿⣿⠟⠛⠋⠁⠀⠀⠀⠀⠀⠀⠈⠉⠛⠻⣿⣿⣿⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⣀⣾⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣷⣀⠀⠀⠀⠀",
                            "⠀⠀⢀⣰⣿⣿⣿⡿⠛⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⣿⣿⣧⡀⠀⠀",
                            "⠀⠀⣼⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣷⠀⠀",
                            "⠀⣾⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣷⠀",
                            "⢰⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⡆",
                            "⢸⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇",
                            "⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⢿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿",
                            "⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⠃⠈⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿",
                            "⢸⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⡿⠁⠀⠀⠈⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡏",
                            "⠸⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡟⠀⠀⠀⠀⠀⢸⣿⣿⣿⣧⡀⠀⣀⡄⠀⠀⠀⠀⣼⣿⣿⣿⡇",
                            "⠀⢿⣿⣿⣿⣦⠀⠀⠀⠀⠀⣶⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣰⣿⣿⣿⡿⠀",
                            "⠀⠀⢻⣿⣿⣿⣧⡀⠀⠠⠼⠿⠿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⡿⠿⠟⠛⠃⢀⣼⣿⣿⣿⡿⠀⠀",
                            "⠀⠀⠈⢻⣿⣿⣿⣷⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠀⠀⣠⣾⣿⣿⣿⡟⠁⠀⠀",
                            "⠀⠀⠀⠀⠉⢿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠙⢻⣿⣿⣿⣿⣷⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀",
                            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠻⠿⠿⢿⣿⣿⣿⣿⡿⠿⠿⠿⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                        },
                        highlight = "Statement",
                        default_color = "",
                        oldfiles_amount = 0,
                    },
                    header_2 = {
                        type = "text",
                        oldfiles_directory = false,
                        align = "center",
                        fold_section = false,
                        title = "Quote",
                        margin = 0,
                        content = require("startup.functions").quote(),
                        highlight = "Constant",
                        default_color = "",
                        oldfiles_amount = 0,
                    },
                    body = {
                        type = "mapping",
                        oldfiles_directory = false,
                        align = "center",
                        fold_section = false,
                        title = "Basic Commands",
                        margin = 0,
                        content = {
                            {" Recent Files","Telescope oldfiles", "<leader>of" },
                            {" File Browser","Telescope file_browser", "<leader>fb" },
                            {" Colorschemes","Telescope colorscheme", "<leader>cs" },
                        },
                        highlight = "String",
                        default_color = "",
                        oldfiles_amount = 0,
                    },
                    projects = {
                        type = "mapping",
                        oldfiles_directory = false,
                        align = "center",
                        fold_section = false,
                        title = "Projects",
                        margin = 0,
                        content = proj,
                        highlight = "String",
                        default_color = "",
                        oldfiles_amount = 0,
                    },
                    footer = {
                        type = "text",
                        oldfiles_directory = false,
                        align = "center",
                        fold_section = false,
                        title = "Footer",
                        margin = 0,
                        content = {date .. " - " .. hhmm},
                        highlight = "Number",
                        default_color = "",
                        oldfiles_amount = 0,
                    },

                    options = {
                        mapping_keys = true,
                        cursor_column = 0.5,
                        empty_lines_between_mappings = false,
                        disable_statuslines = true,
                        paddings = { 2, 2, 2, 2, 2},
                    },
                    mappings = {
                        execute_command = "<CR>",
                        open_file = "o",
                        open_file_split = "<c-o>",
                        open_section = "<TAB>",
                        open_help = "?",
                    },
                    colors = {
                        background = "#1f2227",
                        folded_section = "#56b6c2",
                    },
                    parts = { "header", "header_2", "projects", "body", "footer" },
                })
            end
        },
    }
end

return M;

