return {
	-- You can disable default plugins as follows:
	-- ["goolord/alpha-nvim"] = { disable = true },

	-- You can also add new plugins here as well:
	-- Add plugins, the packer syntax without the "use"
	-- { "andweeb/presence.nvim" },
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },

	-- We also support a key value style plugin definition similar to NvChad:
	-- ["ray-x/lsp_signature.nvim"] = {
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
	--
	--
	['catppuccin/nvim'] = {
		config = function()
			require('catppuccin').setup {
				flavour = 'frappe',
			}
		end,
	},
	{ 'sainnhe/sonokai' },
	{
		-- "~/Developer/jupyter.nvim",
		'dk0d/jupyter.nvim',
	},
	{ 'SirVer/ultisnips' },
	{ 'lervag/vimtex' },
	{
		'KeitaNakamura/tex-conceal.vim',
		module = 'texconceal',
		config = function()
			require('texconceal').setup {
				conceallevel = 1,
				texconceal = 'abdmg',
			}
		end,
	},
	{
		'kdheepak/cmp-latex-symbols',
		after = 'nvim-cmp',
		config = function()
			astronvim.add_user_cmp_source 'latex_symbols'
		end,
	},
	{
		'kylechui/nvim-surround',
		config = function()
			require('nvim-surround').setup {}
		end,
	},
	-- {
	-- 	"hkupty/iron.nvim",
	-- 	config = function()
	-- 		local iron = require("iron.core")
	-- 		iron.setup({
	-- 			config = {
	-- 				scratch_repl = true,
	-- 				repl_definition = {
	-- 					python = {
	-- 						command = { "ipython" },
	-- 						format = require("iron.fts.common").bracketed_paste,
	-- 					},
	-- 				},
	-- 				repl_open_cmd = require("iron.view").bottom(30),
	-- 				keymaps = {
	-- 					send_motion = "<leader>ip",
	-- 					visual_send = "<leader>ip",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup {
				stop_eof = false,
			}
		end,
	},

	--Git
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
	{ 'tpope/vim-sleuth' },

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	},

	{
		'j-hui/fidget.nvim',
		config = function()
			require('fidget').setup {}
		end,
	},
}
