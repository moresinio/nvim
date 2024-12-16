return {
	"rachartier/tiny-inline-diagnostic.nvim",
	enabled = true,
	event = "InsertEnter",
	dependencies = {
		"neovim/nvim-lspconfig",
		opts = { diagnostics = { virtual_text = false } },
	},

	opts = {
		preset = "modern",     -- Can be: "modern", "classic", "minimal", "powerline", ghost", "simple", "nonerdfont", "amongus"
		hi = {
			background = "None",
		},
		-- signs = {
		-- 	left = "",
		-- 	right = "",
		-- 	diag = " 󰀨 ",
		-- 	arrow = "",
		-- 	up_arrow = " ", --
		-- 	vertical = "",
		-- 	vertical_end = "",
		-- },
		options = {
			virt_texts = { priority = 5000 },
			multilines = false,
			multiple_diag_under_cursor = true,
			show_all_diags_on_cursorline = false,
		},
		break_line = {
			enabled = true,
			after = 30,
		},
	},
}
