return {
	"olimorris/persisted.nvim",
	keys = { { '<leader>Ss', '<cmd>SessionSave<CR>', desc = "Session Save" } },
	cmd = { "SessionSave", "SessionLoadLast" },
	config = function()
		require("persisted").setup({})
	end
}
