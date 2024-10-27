return {
	"mikavilpas/yazi.nvim",
	--event = "VeryLazy",
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>-",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	---@type YaziConfig
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		floating_window_scaling_factor = 0.8,
		keymaps = {
			show_help = '<f1>',
		},
	},
}
