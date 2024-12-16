return {
	'akinsho/toggleterm.nvim',
	cmd = "ToggleTerm",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			size = function(term)
				if term.direction == "horizontal" then
					return 11
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end,
      float_opts = {
				border = "curved",
			},
		})
	end
}
