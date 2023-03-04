-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, opts)
end

map('i', 'jk', "<esc>", { desc = "Leave insert mode", noremap = true, silent = true })

-- Line ops
map('v', 'J', "<cmd> m '>+1<cr>gv=gv", { desc = "Move line down" })
map('v', 'K', "<cmd> m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Telescope
map('n', 'sx', require('telescope.builtin').resume, { desc = "Resume previous picker" })
map('n', 'sf', require('telescope.builtin').find_files, { desc = "Find Files" })
map('n', "<leader>fb", require("telescope.builtin").buffers, { desc = "Search buffers" })
map('n', "<leader>fh", require("telescope.builtin").help_tags, { desc = "Search help" })
map('n', "<leader>fm", require("telescope.builtin").marks, { desc = "Search marks" })
map('n', "<leader>fo", require("telescope.builtin").oldfiles, { desc = "Search history" })
map('n', "<leader>fc", require("telescope.builtin").grep_string,
    { desc = "Search for word under cursor" })
map('n', "<leader>sm", function() require("telescope.builtin").man_pages() end, { desc = "Search man" })
map('n', "<leader>sr", function() require("telescope.builtin").registers() end, { desc = "Search registers" })
-- Git
map('n', 'gt', require('telescope.builtin').git_status, { desc = "Git Status" })
map('n', 'gb', require('telescope.builtin').git_branches, { desc = "Git Branches" })

-- DAP
map('n', '<leader>b', "<cmd> lua require'dap'.toggle_breakpoints()<cr>", { desc = 'Toggle Breakpoints' })

-- Format
map('n', '<leader>fd',
    function()
        vim.lsp.buf.format(astronvim.lsp.format_opts)
    end,
    { desc = 'Format Code' }
)

