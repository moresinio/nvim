return {
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('dracula').setup({
				italic_comment = true, -- default false
				--lualine_bg_color = "#282A36", -- default nil
			})
			--vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		'ray-x/starry.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			local config = {
				style = {
					name = 'dracula_blood', -- Theme style name (moonlight, earliestsummer, etc.)
					-- " other themes: dracula, oceanic, dracula_blood, 'deep ocean', darker, palenight, monokai, mariana, emerald, middlenight_blue
					disable = {},       -- a list of styles to disable, e.g. {'bold', 'underline'}
					fix = true,
					darker_contrast = false, -- More contrast for darker style
					daylight_swith = false, -- Enable day and night style switching
					deep_black = false, -- Enable a deeper black background
				},
			}
			require("starry").setup(config)
			--vim.cmd("colorscheme starry")
		end
	},
	{
		'kdheepak/monochrome.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			--vim.cmd 'colorscheme monochrome'
		end
	}, {
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
				variables = {},
				numbers = {},
				constants = {},
				parameters = {},
				keywords = {},
				types = {},
			},
		})
		vim.cmd.colorscheme 'fluoromachine'
	end
},
	-- this theme needs transparent background
	{
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Enable transparent background
				transparent = false,
				borderless_telescope = true,
			})
			--vim.cmd("colorscheme cyberdream")
		end
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--	vim.cmd("colorscheme oxocarbon")
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
			--	vim.cmd [[colorscheme kimbox]]
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--	vim.cmd [[colorscheme tokyonight-night]]
		end,
		opts = {
		}
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
				---Default is "medium".
				background = "soft", -- Your config here
				italics = true,
				--vim.cmd([[colorscheme everforest]])
			})
		end,
	},
}
