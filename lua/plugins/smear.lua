return {
	"sphamba/smear-cursor.nvim",
	enabled = true,
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		legacy_computing_symbols_support = true,
		time_interval = 7, -- milliseconds
		smear_between_buffers = false,
		scroll_buffer_space = false,
		smear_between_neighbor_lines = false,
	},
}
