--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key

-- if vim.fn.filereadable(vim.fn.getcwd() .. "/.vscode/launch.json") then
-- 	require("dap.ext.vscode").load_launchjs(nil, { python = { "python" } })
-- 	P(dap.configurations.python)
-- 	for i, p in ipairs(dap.configurations.python) do
-- 		P(i)
-- 		P(p)
-- 		dap.configurations.python[i].pythonPath = getPythonPath()
-- 	end
-- 	P(dap.configurations.python)
-- end

local config = {
		-- Configure AstroNvim updates
		updater = {
				remote = 'origin', -- remote to use
				channel = 'nightly', -- "stable" or "nightly"
				version = 'latest', -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
				branch = 'main', -- branch name (NIGHTLY ONLY)
				commit = nil, -- commit hash (NIGHTLY ONLY)
				pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
				skip_prompts = false, -- skip prompts about breaking changes
				show_changelog = true, -- show the changelog after performing an update
				auto_reload = false, -- automatically reload and sync packer after a successful update
				auto_quit = false, -- automatically quit the current session after a successful update
				-- remotes = { -- easily add new remotes to track
				--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
				--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
				--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
				-- },
		},
		-- Set colorscheme to use
		colorscheme = 'sonokai',
		-- Add highlight groups in any theme
		highlights = {
				-- set highlights for all themes
				-- use a function override to let us use lua to retrieve colors from highlight group
				-- there is no default table so we don't need to put a parameter for this function
				init = function()
					-- get highlights from highlight groups
					local normal = astronvim.get_hlgroup 'Normal'
					local fg, bg = normal.fg, normal.bg
					local bg_alt = astronvim.get_hlgroup('Visual').bg
					local green = astronvim.get_hlgroup('String').fg
					local red = astronvim.get_hlgroup('Error').fg
					-- return a table of highlights for telescope based on colors gotten from highlight groups
					return {
							TelescopeBorder = { fg = bg_alt, bg = bg },
							TelescopeNormal = { bg = bg },
							TelescopePreviewBorder = { fg = bg, bg = bg },
							TelescopePreviewNormal = { bg = bg },
							TelescopePreviewTitle = { fg = bg, bg = green },
							TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
							TelescopePromptNormal = { fg = fg, bg = bg_alt },
							TelescopePromptPrefix = { fg = red, bg = bg_alt },
							TelescopePromptTitle = { fg = bg, bg = red },
							TelescopeResultsBorder = { fg = bg, bg = bg },
							TelescopeResultsNormal = { bg = bg },
							TelescopeResultsTitle = { fg = bg, bg = bg },
					}
				end,
		},
		-- set vim options here (vim.<first_key>.<second_key> = value)
		-- If you need more control, you can use the function()...end notation
		-- options = function(local_vim)
		--   local_vim.opt.relativenumber = true
		--   local_vim.g.mapleader = " "
		--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
		--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
		--
		--   return local_vim
		-- end,

		-- Default theme configuration
		default_theme = {
				-- Modify the color palette for the default theme
				colors = {
						fg = '#abb2bf',
						bg = '#1e222a',
				},
				highlights = function(hl) -- or a function that returns a new table of colors to set
					local C = require 'default_theme.colors'

					hl.Normal = { fg = C.fg, bg = C.bg }

					-- New approach instead of diagnostic_style
					hl.DiagnosticError.italic = true
					hl.DiagnosticHint.italic = true
					hl.DiagnosticInfo.italic = true
					hl.DiagnosticWarn.italic = true

					return hl
				end,
				-- enable or disable highlighting for extra plugins
				plugins = {
						aerial = true,
						beacon = false,
						bufferline = true,
						cmp = true,
						dashboard = true,
						highlighturl = true,
						hop = false,
						indent_blankline = true,
						lightspeed = false,
						['neo-tree'] = true,
						notify = true,
						['nvim-tree'] = false,
						['nvim-web-devicons'] = true,
						rainbow = true,
						symbols_outline = false,
						telescope = true,
						treesitter = true,
						vimwiki = false,
						['which-key'] = true,
				},
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
				virtual_text = true,
				underline = true,
		},
		-- Extend LSP configuration
		lsp = {
				-- enable servers that you already have installed without mason
				servers = {
						-- "pyright",
				},
				formatting = {
						-- control auto formatting on save
						format_on_save = {
								enabled = true, -- enable or disable format on save globally
								allow_filetypes = { -- enable format on save for specified filetypes only
										-- "go",
								},
								ignore_filetypes = { -- disable format on save for specified filetypes
										-- "python",
								},
						},
						disabled = { -- disable formatting capabilities for the listed language servers
								-- "sumneko_lua",
						},
						timeout_ms = 1000, -- default format timeout
						-- filter = function(client) -- fully override the default formatting function
						--   return true
						-- end
				},
				-- easily add or disable built in mappings added during LSP attaching
				mappings = {
						n = {
								['<leader>lf'] = false, -- disable formatting keymap
						},
				},
				-- add to the global LSP on_attach function
				-- on_attach = function(client, bufnr)
				-- end,

				-- override the mason server-registration function
				-- server_registration = function(server, opts)
				--   require("lspconfig")[server].setup(opts)
				-- end,

				-- Add overrides for LSP server settings, the keys are the name of the server
				['server-settings'] = {
						-- example for addings schemas to yamlls
						-- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
						--   settings = {
						--     yaml = {
						--       schemas = {
						--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
						--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
						--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
						--       },
						--     },
						--   },
						-- },
						--
						pyright = {
								settings = {
										python = {
												analysis = {
														autoSearchPaths = true,
														autoImportCompletion = true,
														diagnosticMode = 'openFilesOnly',
														useLibraryCodeForTypes = true,
														typeCheckingMode = 'off',
												},
										},
								},
						},
				},
		},
		-- Configure plugins
		plugins = {
				dapui = {
						icons = { expanded = '▾', collapsed = '▸', current_frame = 'ﰲ' },
						mappings = {
								expand = '<cr>',
								open = 'o',
								remove = 'd',
								edit = 'e',
								repl = 'r',
								toggle = 't',
						},
						layouts = {
								{
										elements = {
												{ id = 'scopes',  size = 0.25 },
												'breakpoints',
												{ id = 'stacks',  size = 0.25 },
												{ id = 'watches', size = 0.25 },
										},
										size = 40,
										position = 'left',
								},
								{
										elements = {
												{ id = 'repl', size = 0.75 },
												'console',
										},
										size = 0.25,
										position = 'bottom',
								},
						},
						controls = {
								enabled = true,
								element = 'repl',
								icons = {
										pause = '',
										play = '契',
										step_into = '',
										step_over = '',
										step_back = '',
										step_out = '',
										run_last = '磻',
										terminate = '',
								},
						},
						floating = {
								boarder = 'rounded',
								mappings = {
										close = { 'q', '<esc>' },
								},
						},
				},
				-- All other entries override the require("<key>").setup({...}) call for default plugins
				['null-ls'] = function(config) -- overrides `require("null-ls").setup(config)`
					-- config variable is the default configuration table for the setup function call
					-- local null_ls = require "null-ls"

					-- Check supported formatters and linters
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
					-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
					config.sources = {
							-- Set a formatter
							-- null_ls.builtins.formatting.stylua,
							-- null_ls.builtins.formatting.prettier,
					}
					return config -- return final config table
				end,

				treesitter = { -- overrides `require("treesitter").setup(...)`
						ensure_installed = { 'lua', 'python', 'rust', 'bash', 'c', 'cpp', 'help' },
						textobjects = {
								select = {
										enable = true,
										lookahead = true,
										keymaps = {
												['aa'] = '@parameter.outer',
												['ia'] = '@parameter.inner',
												['af'] = '@function.outer',
												['if'] = '@function.inner',
												['ac'] = '@class.outer',
												['ic'] = '@class.inner',
										},
								},
								move = {
										enable = true,
										set_jumps = true,
										goto_next_start = {
												[']m'] = '@function.outer',
												[']]'] = '@function.outer',
										},
										goto_next_end = {
												[']M'] = '@function.outer',
												[']['] = '@class.outer',
										},
										goto_previous_start = {
												['[m'] = '@function.outer',
												['[['] = '@class.outer',
										},
										goto_previous_end = {
												['[M'] = '@function.outer',
												['[]'] = '@class.outer',
										},
								},
								swap = {
										enable = true,
										swap_next = {
												['<leader>a'] = '@parameter.inner',
										},
										swap_previous = {
												['<leader>A'] = '@parameter.inner',
										},
								},
						},
				},
				-- use mason-lspconfig to configure LSP installations
				['mason-lspconfig'] = { -- overrides `require("mason-lspconfig").setup(...)`
						ensure_installed = { 'lua_ls', 'pyright' },
				},
				-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
				['mason-null-ls'] = { -- overrides `require("mason-null-ls").setup(...)`
						ensure_installed = { 'prettier', 'stylua', 'autopep8' },
				},

				['mason-nvim-dap'] = { -- overrides `require("mason-nvim-dap").setup(...)`
						ensure_installed = { 'python' },
				},

				['neo-tree'] = {
						window = {
								width = 40,
								mappings = {
										o = 'open',
										O = function(state)
											astronvim.system_open(state.tree:get_node():get_id())
										end,
										['{'] = 'prev_source',
										['}'] = 'next_source',
								},
						},
				},
		},
		-- LuaSnip Options
		luasnip = {
				-- Extend filetypes
				filetype_extend = {
						-- javascript = { "javascriptreact" },
				},
				-- Configure luasnip loaders (vscode, lua, and/or snipmate)
				vscode = {
						-- Add paths for including more VS Code style snippets in luasnip
						paths = {},
				},
		},
		-- CMP Source Priorities
		-- modify here the priorities of default cmp sources
		-- higher value == higher priority
		-- The value can also be set to a boolean for disabling default sources:
		-- false == disabled
		-- true == 1000
		cmp = {
				source_priority = {
						nvim_lsp = 1000,
						luasnip = 750,
						buffer = 500,
						path = 250,
				},
		},
		-- Modify which-key registration (Use this with mappings table in the above.)
		['which-key'] = {
				-- Add bindings which show up as group name
				register = {
						-- first key is the mode, n == normal mode
						n = {
								-- second key is the prefix, <leader> prefixes
								['<leader>'] = {
										-- third key is the key to bring up next level and its displayed
										-- group name in which-key top level menu
										['b'] = { name = 'Buffer' },
								},
						},
				},
		},
}

return config
