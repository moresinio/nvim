return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>d", group = "DAP" },
		},
		opts = {
			preset = "helix",
			win = {
				border = "rounded",
			},
		},
	},
}
