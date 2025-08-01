return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see above for full list of optional dependencies ☝️
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Documents/notes/",
			},
		},
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 0,
		},

		new_notes_location = "current_dir",

		disable_frontmatter = true,

		templates = {
			folder = "Template",
			date_format = "%Y%m%d%H%M",
		},

		picker = {
			name = "snacks.pick",
			note_mappings = {
				new = "<C-x>",
				-- Insert a link to the selected note.
				insert_link = "<C-l>",
			},
		},
	},
}
