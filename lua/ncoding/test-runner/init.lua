local M = {}

-- Get current file path
local function get_current_file()
    local file = vim.api.nvim_buf_get_name(0)
    if file == "" then
        return nil
    end
    return file
end

-- Run npm test for current file and show output in a split buffer
function M.run_test(mode)
    local file = get_current_file()
    if not file then
        print("No file found")
        return
    end


    -- Determine buffer name
    local buf_name = "Test Output: " .. vim.fn.fnamemodify(file, ":t")

    -- Reuse existing buffer if available
    local buf = vim.fn.bufnr(buf_name)
    if buf == -1 then
        buf = vim.api.nvim_create_buf(false, true) -- listed=false, scratch buffer
        vim.api.nvim_buf_set_name(buf, buf_name)
    else
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {}) -- clear previous content
    end


    -- Open a split window
    vim.cmd("belowright split")
    vim.api.nvim_win_set_buf(0, buf)

    -- Buffer options
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "hide"
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = true
    vim.bo[buf].filetype = "output"


    local cmd = {}
    if mode == "debug" then
         cmd = { "npm", "run", "test", "--", file, "--debug" }
    elseif mode == "normal" then
         cmd = { "npm", "run", "test", "--", file }
    end


    -- Run asynchronously
    vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
                vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(buf), 0})
            end
        end,
        on_stderr = function(_, data)
            if data then
                vim.api.nvim_buf_set_lines(buf, -1, -1, false, data)
                vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(buf), 0})
            end
        end,
        on_exit = function(_, code)
            vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "Test process exited with code " .. code })
            vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(buf), 0})
        end,
    })
end

function M.setup()
    vim.api.nvim_create_user_command("RunTest", function(opts)
            M.run_test(opts.args)
        end, {nargs = "?"})
end

return M
