return {
		"norcalli/nvim-colorizer.lua",
		--event = "VeryLazy",
		cmd = "ColorizerToggle",
		config = function()
			require('colorizer').setup {}
		end,
}
