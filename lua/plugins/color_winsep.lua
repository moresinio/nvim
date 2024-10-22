local get_hl_attr = require("plugins.Ui.hlgroups").get_hl_attr
local fg_color = get_hl_attr("Debug", "fg")
return {
	"nvim-zh/colorful-winsep.nvim",
	enabled = false,
	config = true,
	event = { "WinNew" },
	opts = {
		no_exec_files = { "packer", "neotree", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
		symbols = { "─", "│", "╭", "╮", "╰", "╯" },
		hi = {
			fg = fg_color
		},
	}
}
