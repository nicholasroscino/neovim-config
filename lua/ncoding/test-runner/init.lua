local M = {}

local function get_current_file()
    local file = vim.api.nvim_buf_get_name(0)
    if file == "" then
        return nil
    end
    return file
end

function M.run_test(mode)
    local file = get_current_file()
    if not file then
        print("No file found")
        return
    end

    local cmd = {}
    if mode == "debug" then
         cmd = { "npm", "run", "test", "--", file, "--debug" }
    elseif mode == "normal" then
         cmd = { "npm", "run", "test", "--", file }
    end

    local commandString = "belowright split | term";

    for i = 1, #cmd do
        commandString = commandString .. " %s"
    end

    commandString = string.format(commandString, unpack(cmd))
    vim.cmd(commandString)
end

function M.setup()
    vim.api.nvim_create_user_command("RunTest", function(opts)
            M.run_test(opts.args)
        end, {nargs = "?"})
end

return M
