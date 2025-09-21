return {
    {
        dir = "~/.config/nvim/lua/ncoding/project-list",
        name = "project-list",
        depenencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function ()
            require("ncoding.project-list").setup({})
        end
    }
}
