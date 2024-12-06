return {
	"lewis6991/satellite.nvim",
	event = "VeryLazy",
	opts = {
		current_only = true,
		zindex = 30,
		handlers = {
			cursor = {
				enable = true,
			},
			search = {
				enable = true,
			},
			diagnostic = {
				enable = false,
				signs = { '-', '=', '≡' },
				min_severity = vim.diagnostic.severity.HINT,
			},
			gitsigns = {
				enable = false,
				signs = {   -- can only be a single character (multibyte is okay)
					add = "│",
					change = "│",
					delete = "-",
				},
			},
			marks = {
				enable = true,
				key = 'm',
				show_builtins = true,   -- shows the builtin marks like [ ] < >
			},
		},
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
