return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = true,
	event = "BufAdd",
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
			indent = { char = "▏" },

		})
	end,
}
