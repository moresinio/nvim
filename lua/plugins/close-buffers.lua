return {
	{
		'kazhala/close-buffers.nvim',
		event = "InsertEnter",
		keys = {
			{ "<F4>", "<cmd>BDelete this<cr>", desc = "Buffer close" }
		},
	},
}
