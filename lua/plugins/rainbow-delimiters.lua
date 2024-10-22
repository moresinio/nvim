return {
		'hiphish/rainbow-delimiters.nvim',
		event = "VeryLazy",
		dependencies = 'nvim-treesitter/nvim-treesitter',
		config = function()
			require('rainbow-delimiters')
		end
}
