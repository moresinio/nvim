return {
	'stevearc/conform.nvim',
	event = "VeryLazy",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "never",
			},
		})
	end,
}
