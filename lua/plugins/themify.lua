return {
	'lmantw/themify.nvim',
	enabled = true,
	lazy = false,
	priority = 900,
	config = {
		activity = false,
		async = true,

		{
			'maxmx03/fluoromachine.nvim',
			before = function()
				require('fluoromachine').setup({
					glow = false,
					theme = 'fluoromachine', --delta fluoromachine retrowave
					transparent = false,
					styles = {
						comments = { italic = true, },
						functions = { italic = true, },
					},
					overrides = {
						['WinSeparator'] = { bg = '#1b172b' },
						['FloatBorder'] = { bg = '#241b2f' },
						['TelescopeBorder'] = { bg = '#241b2f', fg = '#8c57c7' },
						['YaziFloat'] = { bg = '#241b2f' },
						['IncSearch'] = { fg = '#ffcc00' },
						['YankyYanked'] = { fg = '#ffcc00' },
						['WhichKeyTitle'] = { fg = '#ffcc00', bg = '#503e26' },
						['Normal'] = { fg = '#8ba7a7', bg = '#1b172b' },
						['SignColumn'] = { bg = '#1b172b' },
						['FoldColumn'] = { fg = '#8ba7a7', bg = '#1b172b' },
						['LineNr'] = { fg = '#495495', bg = '#1b172b' },
						['CursorLineNr'] = { fg = '#fc199a', bg = '#1b172b' },
					}
				})
			end
		},

		"lunarvim/synthwave84.nvim",
    "samharju/synthweave.nvim",
		"Mofiqul/dracula.nvim",
	--	"lmburns/kimbox",
		"folke/tokyonight.nvim",
		"eldritch-theme/eldritch.nvim",
		{
			"ellisonleao/gruvbox.nvim",
			before = function()
				require("gruvbox").setup({
					contrast = "soft", -- can be "hard", "soft" or empty string
					inverse = false, -- invert background for search, diffs, statuslines and errors
				})
			end
		}
	}
}
