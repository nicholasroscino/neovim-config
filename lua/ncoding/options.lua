vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.wo.cursorline = true
vim.g.have_nerd_font = true
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true

vim.o.confirm = true

vim.o.scrolloff = 20

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = 'split'

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

local copy_cmd = {
  "bash",
  "-c",
  [[
    # Get content from stdin (piped from Neovim)
    CONTENT=$(cat);

    # Get the correct TTY device for the client from tmux itself
    TTY_DEVICE=$(tmux display-message -p '#{client_tty}');

    # Base64 encode the content
    B64_PAYLOAD=$(echo -n "$CONTENT" | base64 | tr -d '\n');

    # Construct the full wrapped sequence
    OSC52_SEQUENCE=$(printf '\033Ptmux;\033\033]52;c;%s\x07\033\\' "$B64_PAYLOAD");

    # Write the sequence DIRECTLY to the correct TTY device
    printf "%s" "$OSC52_SEQUENCE" > "$TTY_DEVICE";
  ]],
}-- local copy_cmd = {
--   "bash",
--   "-c",
--   -- We use Lua's long string literal [[...]] to avoid escaping issues.
--   -- This is the exact logic from the working script.
--   [[
--     CONTENT=$(cat);
--     B64_PAYLOAD=$(echo -n "$CONTENT" | base64 | tr -d '\n');
--     printf '\033Ptmux;\033\033]52;c;%s\x07\033\\' "$B64_PAYLOAD"
--   ]],
-- }
local paste_cmd = { "tmux", "save-buffer", "-" }

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "tmux_clipboard_osc52_bridge",
  copy = {
    ["+"] = copy_cmd,
    ["*"] = copy_cmd,
  },
  paste = {
    ["+"] = paste_cmd,
    ["*"] = paste_cmd,
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99 -- :h foldlevelstart -- 99 -> no folds closed
vim.opt.foldnestmax = 4


local virt_lines_ns = vim.api.nvim_create_namespace 'on_diagnostic_jump'

local function on_jump(diagnostic, bufnr)
    if not diagnostic then return end

    vim.diagnostic.show(
        virt_lines_ns,
        bufnr,
        { diagnostic },
        { virtual_lines = { current_line = true }, virtual_text = false }
    )
end

vim.diagnostic.config({
    jump = {
        on_jump = on_jump,
    },
})
