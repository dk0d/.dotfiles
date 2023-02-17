local getpython = require('user.utils').getpython
require('dap.ext.vscode').load_launchjs()
return {
		adapters = {
				python = {
						type = 'executable',
						command = getpython(),
						args = { '-m', 'debugpy.adapter' },
				},
				rust = {
						type = 'executable',
						command = 'cargo run',
						args = { '--color', 'always' },
				},
		},
		configurations = {
				rust = {
						{
								type = 'lldb',
								request = 'launch',
								name = 'Run File',
								cwd = '${workspaceFolder}',
								program = function()
									return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
								end,
								stopOnEntry = false,
								args = {},
								runInTerminal = false,
						},
						{
								type = 'lldb',
								request = 'launch',
								name = 'Run Project',
								program = '${workspaceFolder}/src/main.rs',
						},
				},
				-- 	python = {
				-- 		{
				-- 			type = "python",
				-- 			request = "launch",
				-- 			name = "Launch File",
				-- 			program = "${file}",
				-- 			pythonPath = getpython(),
				-- 		},
				-- 	},
		},
}
