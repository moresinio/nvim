return { "tiagovla/scope.nvim",
		dependencies = 'nvim-telescope/telescope.nvim',
	event = "BufAdd",
	config = function()
		require("scope").setup()
	end
}
