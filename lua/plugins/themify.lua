return {
	'lmantw/themify.nvim',
	enabled = true,
	lazy = false,
	priority = 999,
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
						['WinSeparator'] = { bg = '#262335' },
						['FloatBorder'] = { bg = '#241b2f' },
						['TelescopeBorder'] = { bg = '#241b2f', fg = '#8c57c7' },
						['YaziFloat'] = { bg = '#241b2f' },
						['IncSearch'] = { fg = '#ffcc00' },
						['YankyYanked'] = { fg = '#ffcc00' },
					}
				})
			end
		},

		"Mofiqul/dracula.nvim",
		"lmburns/kimbox",
		"folke/tokyonight.nvim",
	}
}
