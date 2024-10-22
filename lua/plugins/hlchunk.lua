return {
	"shellRaining/hlchunk.nvim",
	enabled = false,
	event = "UIEnter",
	config = function()
		require('hlchunk').setup({
			chunk = {
				enable = true,
				notify = true,
				use_treesitter = true,
				-- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
				chars = {
					enable = false,
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "╭",
					left_bottom = "╰",
					right_arrow = ">",
				},
				style = {
					{ fg =vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Conditional")), "fg", "gui") },
					{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Error")), "fg", "gui") }
				},
				textobject = "ic",
				max_file_size = 1024 * 1024,
				error_sign = true,
				-- animation related
				duration = 0,
				delay = 0,
			},

			indent = {
				enable = true,
				use_treesitter = true,
				chars = {
					"│",
				},
				style = {
					{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") }
				},
			},

			line_num = {
				enable = false,
				use_treesitter = true,
				style = { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("CursorLineNr")), "fg", "gui") }
				,
			},

			blank = {
				enable = true,
				chars = { " ", "․", "⁚", "⁖", "⁘", "⁙" },
				style = {
					vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
				},
			},
		})
	end,
}
