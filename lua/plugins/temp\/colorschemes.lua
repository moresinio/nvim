return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('dracula').setup({
				italic_comment = true, -- default false
			})
			--vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		'maxmx03/fluoromachine.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('fluoromachine').setup({
				glow = false,
				theme = 'fluoromachine', --delta fluoromachine retrowave
				transparent = false,
				styles = {
					comments = { italic = true, },
					functions = { italic = true, },
				},
				overrides = {
					['WinSeparator'] = { bg = '#262335' },
					['FloatBorder'] = { bg = '#241b2f' },
					['TelescopeBorder'] = { bg = '#241b2f', fg = '#8c57c7' },
					['YaziFloat'] = { bg = '#241b2f' },
					['IncSearch'] = { fg = '#ffcc00' },
					['YankyYanked'] = { fg = '#ffcc00' },
				}
			})
			vim.cmd.colorscheme 'fluoromachine'
		end
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		priority = 1000,
		config = function()
			--vim.cmd("colorscheme oxocarbon")
		end,
	},
	{
		"lmburns/kimbox",
		lazy = false,
		priority = 1000,
		config = function()
			require("kimbox").setup({
				style = "eerie", -- 'burnt_coffee', no 'cannon', 'used_oil', 'deep', 'zinnwaldite', 'eerie',
				allow_italic = true,
				toggle_style = { key = "" },
			})
			--vim.cmd [[colorscheme kimbox]]
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.cmd [[colorscheme tokyonight-night]]
		end,
		opts = {
		}
	},
 -- {
 -- 	"neanias/everforest-nvim",
 -- 	version = false,
 -- 	lazy = false,
 -- 	priority = 1000, -- make sure to load this before all the other start plugins
 -- 	-- Optional; default configuration will be used if setup isn't called.
 -- 	config = function()
 -- 		require("everforest").setup({
 -- 			---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
 -- 			---Default is "medium".
 -- 			background = "soft", -- Your config here
 -- 			italics = true,
 -- 			--	vim.cmd([[colorscheme everforest]])
 -- 		})
 -- 	end,
 -- },
}
