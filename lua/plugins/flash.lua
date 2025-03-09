return {
	"folke/flash.nvim",
	event = "BufAdd",
	keys = {
		{ "<M-s>", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
		{ "<M-v>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		-- { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
		-- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,     desc = "Toggle Flash Search" },
	},
	config = function()
		require("flash").setup({
			labels = "asdfghjklqwertyuiopzxcvbnm67890",
			search = {
				-- search/jump in all windows
				multi_window = true,
				mode = "search",
			},
			jump = {
				nohlsearch = true,
				autojump = true,
			},
			modes = {
				char = {
					multi_line = false,
					highlight = { backdrop = false },
				}
			}
		})
	end
}
