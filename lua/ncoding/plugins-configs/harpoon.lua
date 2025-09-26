return {
    "ThePrimeagen/harpoon",
    config = function ()
        local harpoonMarks = require("harpoon.mark");
        local harpoonUi = require("harpoon.ui");

        vim.keymap.set("n", "<ESC>Ը", function ()
            harpoonUi.toggle_quick_menu()
        end, {desc = "Harpoon add file"})
        vim.keymap.set("n", "<leader>ha", function ()
            harpoonMarks.add_file()
        end, {desc = "Harpoon add file"})
    end
}
