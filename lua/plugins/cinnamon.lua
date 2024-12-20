return
	{
		"declancm/cinnamon.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			require("cinnamon").setup {
				-- Enable all provided keymaps
				keymaps = {
					basic = true,
					extra = true,
				},
				-- Only scroll the window
				options = { mode = "cursor" },
			}
		end
	}
