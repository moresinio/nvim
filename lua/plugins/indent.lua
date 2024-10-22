return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = true,
	event = "UIEnter",
	config = function()
		require("ibl").setup {
			indent = { char = "▏" },
		}
	end,
}
