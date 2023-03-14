-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
map("i", "jk", "<esc>", { desc = "Leave insert mode", noremap = true, silent = true })

-- Line ops
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Telescope
map("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "Search Keymaps" })
map("n", "<leader>sx", require("telescope.builtin").resume, { desc = "Resume previous picker" })
map("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Find Files" })
map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Search buffers" })
map("n", "<leader>sp", require("telescope.builtin").help_tags, { desc = "Search help" })
map("n", "<leader>sh", require("telescope.builtin").oldfiles, { desc = "Search history" })
map("n", "<leader>sc", require("telescope.builtin").grep_string, { desc = "Search for word under cursor" })
map("n", "<leader>sm", require("telescope.builtin").marks, { desc = "Search marks" })
map("n", "<leader>sM", require("telescope.builtin").man_pages, { desc = "Search man" })
map("n", "<leader>sr", require("telescope.builtin").registers, { desc = "Search registers" })

-- Git
map("n", "<leader>gt", require("telescope.builtin").git_status, { desc = "Git Status" })
map("n", "<leader>gb", require("telescope.builtin").git_branches, { desc = "Git Branches" })

-- DAP
if Util.has("nvim-dap.nvim") then
  map("n", "<leader>b", require("dap").toggle_breakpoints, { desc = "Toggle Breakpoints" })
  map("n", "<leader>bl", require("dap").list_breakpoints, { desc = "List Breakpoints" })
  map("n", "<leader>da", require("dap").clear_breakpoints, { desc = "Clear Breakpoints" })
  map("n", "<leader>dc", function()
    require("dap").set_breakpoint(vim.fn.input("Condition"))
  end, { desc = "Set Conditional Breakpoint: " })
  map("n", "<leader>xc", require("dap").continue, { desc = "DAP Debug continue" })
  map("n", "<leader>so", require("dap").step_over, { desc = "DAP Step over" })
  map("n", "<leader>si", require("dap").step_into, { desc = "DAP Step into" })
  map("n", "<leader>su", require("dap").step_out, { desc = "DAP Step out" })
  map("n", "<leader>st", require("dap").terminate, { desc = "DAP Terminate" })
  map("n", "<leader>dl", require("dap").run_last, { desc = "DAP Run Last" })
end

-- Comment

if Util.has("Comment.nvim") then
  map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
  end, { desc = "Comment line" })
  map(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "Toggle comment line" }
  )
end

-- Format
map("n", "<leader>fd", function()
  vim.lsp.buf.format()
end, { desc = "Format Code" })

-- Diagnostics
map("n", "ge", function()
  vim.diagnostic.goto_next({ wrap = true, float = true })
end, { desc = "Diagnostic goto next" })
map("n", "gE", function()
  vim.diagnostic.goto_prev({ wrap = true, float = true })
end, { desc = "Diagnostic goto previous" })
map("n", "<leader>sl", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Diagnostic open float" })
