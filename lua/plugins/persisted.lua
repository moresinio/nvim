return {
	"olimorris/persisted.nvim",
	event = "VeryLazy",
	keys = { { '<leader>Ss', '<cmd>SessionSave<CR>', desc = "Session Save" } },
	cmd = { "SessionSave", "SessionLoad" },
	config = function()
		require("persisted").setup({})
	end
}
