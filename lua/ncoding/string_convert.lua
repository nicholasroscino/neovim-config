-- This file should be placed in your Neovim configuration directory,
-- for example: ~/.config/nvim/lua/string_convert.lua

-- Define an autocmd group to prevent multiple triggers
local custom_group = vim.api.nvim_create_augroup("StringConversionGroup", { clear = true })

-- Function to check and convert quotes to backticks on the current line
local function convert_quotes_in_string()
    -- Get the current cursor position (1-indexed line and column)
    local line_num = vim.fn.line('.')
    local col = vim.fn.col('.')

    -- Get the character just before the cursor
    local pre_cursor_char = vim.api.nvim_buf_get_text(0, line_num - 1, col - 2, line_num - 1, col - 1, {})[1]

    -- Check if the character just inserted was a dollar sign
    if pre_cursor_char ~= '$' then
        return
    end

    -- Get the full line text
    local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, false)[1]

    -- Search backwards from the current position to find an opening quote
    local start_pos = nil
    for i = col - 2, 1, -1 do
        local char = line_text:sub(i, i)
        if char == "'" or char == '"' then
            start_pos = i
            break
        end
    end

    -- If no opening quote is found, we can't convert, so exit
    if not start_pos then
        return
    end

    -- Search forwards from the current position to find a matching closing quote
    local end_pos = nil
    for i = col, #line_text do
        local char = line_text:sub(i, i)
        if char == "'" or char == '"' then
            end_pos = i
            break
        end
    end

    -- If no closing quote is found, exit
    if not end_pos then
        return
    end
    
    -- Extract the string content between the quotes
    local content = line_text:sub(start_pos + 1, end_pos - 1)
    
    -- Create the new line with the backticks
    local new_line = line_text:sub(1, start_pos - 1) .. '`' .. content .. '`' .. line_text:sub(end_pos + 1)
    
    -- Update the buffer with the new line
    vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, false, {new_line})

    -- Restore the cursor position
    vim.api.nvim_win_set_cursor(0, {line_num, col-1})
end

-- Create the autocmd to run the function when a text is changed in insert mode
-- This event is more suitable for buffer modifications than InsertCharPre.
vim.api.nvim_create_autocmd("TextChangedI", {
    group = custom_group,
    callback = convert_quotes_in_string,
    desc = "Converts strings with $ to backticks while in insert mode",
})

