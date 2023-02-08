-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
	-- first key is the mode
	i = {},
	v = {
		['J'] = { "<cmd> m '>+1<cr>gv=gv", desc = 'Move line down' },
		['K'] = { "<cmd> m '<-2<cr>gv=gv", desc = 'Move line up' },
	},
	n = {
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		['<leader>bb'] = { '<cmd>tabnew<cr>', desc = 'New tab' },
		['<leader>bc'] = { '<cmd>BufferLinePickClose<cr>', desc = 'Pick to close' },
		['<leader>bj'] = { '<cmd>BufferLinePick<cr>', desc = 'Pick to jump' },
		['<leader>bt'] = { '<cmd>BufferLineSortByTabs<cr>', desc = 'Sort by tabs' },
		-- Scrolling
		['<c-d>'] = { '<c-d>zz', desc = 'scroll and center' },
		['<c-u>'] = { '<c-u>zz', desc = 'scroll and center' },
		-- quick save
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		['<leader>fd'] = {
			function()
				vim.lsp.buf.format(astronvim.lsp.format_opts)
			end,
			desc = 'Format document',
		},

		-- Debugging
		['<leader>b'] = { "<cmd> lua require'dap'.toggle_breakpoint()<cr>", desc = 'Toggle Breakpoint' },
		['<leader>bl'] = { "<cmd> lua require'dap'.list_breakpoints()<cr>", desc = 'List Breakpoints' },
		['<leader>da'] = { "<cmd> lua require'dap'.clear_breakpoints()<cr>", desc = 'Clear Breakpoints' },
		['<leader>dc'] = {
			"<cmd> lua require'dap'.set_breakpoint(vim.fn.input('Condition'))<cr>",
			desc = 'Set Conditional Breakpoint: ',
		},
		['<leader>xc'] = { "<cmd> lua require'dap'.continue()<cr>", desc = 'DAP Debug continue' },
		['<leader>so'] = { "<cmd> lua require'dap'.step_over()<cr>", desc = 'DAP Step over' },
		['<leader>si'] = { "<cmd> lua require'dap'.step_into()<cr>", desc = 'DAP Step into' },
		['<leader>su'] = { "<cmd> lua require'dap'.step_out()<cr>", desc = 'DAP Step out' },
		['<leader>st'] = { "<cmd> lua require'dap'.terminate()<cr>", desc = 'DAP Terminate' },
		['<leader>dl'] = { "<cmd> lua require'dap'.run_last()<cr>", desc = 'DAP Run Last' },

		-- ToggleTerm
		['<leader>h'] = { "<cmd> ToggleTerm direction='horizontal' size=12<cr>", desc = 'Horizontal Terminal' },
		['<leader>v'] = { "<cmd> ToggleTerm direction='vertical' size=64<cr>", desc = 'Vertical Terminal' },
		['<C-\\>'] = { "<cmd> ToggleTerm direction='float'<cr>", desc = 'Float Terminal' },

		-- Jupyter.nvim
		['<leader>jqt'] = { '<cmd>JupyterConnect<cr>', desc = 'Connect to QtConsole' },
		['<leader>jf'] = { '<cmd>JupyterRunFile<cr>', desc = 'Run Current File' },
		['<leader>jc'] = { '<cmd>JupyterSendCell<cr>', desc = 'Run Current Cell' },
		['<leader>jo'] = { '<cmd><Plug>JupyterRunTextObj<cr>', desc = 'Run Current Cell' },
		['<leader>jv'] = { '<cmd><Plug>JupyterRunVisual<cr>', desc = 'Run Current Cell' },

		-- Diagnostics
		['ge'] = {
			-- "<cmd> lua vim.diagnostic.goto_next()<cr>",
			function()
				vim.diagnostic.goto_next { wrap = true, float = true }
			end,
			desc = 'Diagnostic goto next',
		},
		['gE'] = {
			-- "<cmd> lua vim.diagnostic.goto_next()<cr>",
			function()
				vim.diagnostic.goto_prev { wrap = true, float = true }
			end,
			desc = 'Diagnostic goto previous',
		},
		['<leader>sl'] = {
			function()
				vim.diagnostic.open_float(0, {
					scope = 'line',
				})
			end,
			desc = 'Diagnostic open float',
		},
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
	},
}
