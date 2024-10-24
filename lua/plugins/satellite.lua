return {
	"lewis6991/satellite.nvim",
	event = "VeryLazy",
	opts = {
		current_only = true,
		zindex = 30,
		handlers = { diagnostic = { enable = false } },
		excluded_filetypes = {
			"alpha",
			"neo-tree",
			"neotest-summary",
			"aerial",
			"noice",
			"TelescopePrompt",
			"chatgpt-input",
			"neo-tree-preview",
		},
	},
}
