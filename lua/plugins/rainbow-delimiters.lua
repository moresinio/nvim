return {
		'hiphish/rainbow-delimiters.nvim',
		--event = "UiEnter",
		ft = { "cpp", "lua", },
		dependencies = 'nvim-treesitter/nvim-treesitter',
		config = function()
			require('rainbow-delimiters')
		end
}
