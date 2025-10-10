local M = {}

function M.moveToProject(path)
    local oil = require("oil");
    vim.api.nvim_set_current_dir(path);
    print(path);
    oil.open(path);
end

return M;
