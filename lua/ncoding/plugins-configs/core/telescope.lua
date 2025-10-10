local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local n_lines = math.abs(s_end[2] - s_start[2]) + 1
  local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
  lines[1] = string.sub(lines[1], s_start[3], -1)
  if n_lines == 1 then
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
  else
    lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
  end
  return table.concat(lines, '\n')
end

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        mode = { "n" },
        desc = "find grep text"
      }
    },
    config = function()
      local tele = require("telescope")

      tele.setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules%/.*",
            "package%-lock.json",
            "lazy%-lock.json"
          }
        },
      });

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<ESC>Դ", builtin.buffers, { desc = "Find in buffers" })
      vim.keymap.set("n", "<ESC>Զ", builtin.live_grep, { desc = "Live grep on files" })
      vim.keymap.set("n", "<ESC>Թ", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search grep text" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
      vim.keymap.set("v", "<S-F>", builtin.grep_string, { desc = "Grep highlighted string" })
      vim.keymap.set("v", "<leader>/", "y<ESC>:Telescope current_buffer_fuzzy_find<ESC><ESC>p", { desc = "Grep highlighted string" })
      vim.keymap.set("n", "<leader>/", "yiw<ESC>:Telescope current_buffer_fuzzy_find<ESC><ESC>p", { desc = "Grep highlighted string" })
    end
  }
}
