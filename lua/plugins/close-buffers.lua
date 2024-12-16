return {
	{
		'kazhala/close-buffers.nvim',
		enabled = false,
		event = "InsertEnter",
		keys = {
			{ "<F4>", "<cmd>BDelete this<cr>", desc = "Buffer close" }
		},
	},
}
