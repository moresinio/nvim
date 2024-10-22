local function jump_or_open(results, open, jump)
	if #results == 1 then
		jump(results[1])
	else
		open(results)
	end
end

return {
	"dnlhc/glance.nvim",
	keys = {
		{ "<leader>gd", "<cmd>Glance definitions<cr>",      desc = "Show definitions (peek window)" },
		{ "<leader>gr", "<cmd>Glance references<cr>",       desc = "Show references (peek window)" },
		{ "<leader>gy", "<cmd>Glance type_definitions<cr>", desc = "Show type definitions (peek window)" },
		{ "<leader>gm", "<cmd>Glance implementations<cr>",  desc = "Show implementations (peek window)" },
	},
	opts = {
		theme = { enable = true },
		mode = "auto", -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme

		border = {
			enable = true,
			top_char = "▁",
			bottom_char = "▔",
		},

		hooks = { before_open = jump_or_open },
	},
}
