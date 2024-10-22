return {
	'rcarriga/nvim-notify',
	enabled = true,
	config = function()
		require('notify').setup({
			--background_color = "#000000",
			timeout = 3000,
			top_down = true,
			max_height = function()
				return math.floor(vim.o.lines * 0.60)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.40)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		})
	end
}
