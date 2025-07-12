return {
	"oskarrrrrrr/symbols.nvim",
	enabled = true,
	cmd = "Symbols toggle",
	keys = {
		{ "<leader>ts", "<cmd>SymbolsToggle<cr>", desc = "Toggle symbols" },
	},
	config = function()
		local r = require("symbols.recipes")
		require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
			-- custom settings here
			-- e.g. hide_cursor = false
		})
	end
}
