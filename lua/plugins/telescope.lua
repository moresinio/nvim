return {
	{
		"nvim-lua/plenary.nvim",
		cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" },
	},

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	},

	{
		'nvim-telescope/telescope.nvim',
		event = "VeryLazy",
		dependencies = { { 'nvim-lua/plenary.nvim' }, "telescope-fzf-native.nvim" },
		cmd = "Telescope oldfiles",
		keys = {
			{ "<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "OldFiles" },
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup {
				defaults = {
					mappings = {
						i = {
							["`"] = actions.close
						},
					},
					layout_strategy = "vertical",
					layout_config = {
						height = 0.95,
						width = 0.95,
						horizontal = {
							prompt_position = "bottom",
							preview_cutoff = 120,
						},
						vertical = {
							mirror = false,
							preview_cutoff = 10,
							prompt_position = "bottom",
							-- other layout configuration here
						},
					},
					pickers = {
						find_files = {
							hidden = true,
						},
						live_grep = {
							--@usage don't include the filename in the search results
							only_sort_text = true,
						},
						grep_string = {
							only_sort_text = true,
						},
						buffers = {
							initial_mode = "normal",
							mappings = {
								i = {
									["<C-d>"] = actions.delete_buffer,
								},
								n = {
									["dd"] = actions.delete_buffer,
								},
							},
						},
						planets = {
							show_pluto = true,
							show_moon = true,
						},
						git_files = {
							hidden = true,
							show_untracked = true,
						},
						colorscheme = {
							enable_preview = true,
						},
					},
					extensions = {
						fzf = {
							fuzzy = true,            -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- or "ignore_case" or "respect_case"
							-- the default case_mode is "smart_case"
						},
					}
				},
			}
			require("telescope").load_extension("fzf")
		end
	},
	-- for telescope-fzf-native.nvim:
	--require('telescope').load_extension('fzf')
}
