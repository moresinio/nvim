return {
	"folke/noice.nvim",
	version = "4.4.7",
	enabled = true,
	event = "VimEnter",
	keys = {
		{ "<leader>n", "<cmd>NoiceHistory<cr>", desc = "Notification" },
	},
	dependencies = {
		{
			"MunifTanjim/nui.nvim",
			config = function()
				require("plugins.Ui.nui")
			end
		},
		{ "rcarriga/nvim-notify" },
	},
	config = function()
		require('noice').setup({

			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},

			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},

				progress = {
					enabled = true,
					-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
					-- See the section on formatting for more details on how to customize.
					--- @type NoiceFormat|string
					format = "lsp_progress",
					--- @type NoiceFormat|string
					format_done = "lsp_progress_done",
					throttle = 1000 / 30, -- frequency to update lsp progress message
					view = "mini",
				},

				hover = {
					enabled = false,
					silent = false, -- set to true to not show a message if hover is not available
					view = nil, -- when nil, use defaults from documentation
					---@type NoiceViewOptions
					opts = {}, -- merged with defaults from documentation
				},

				signature = {
					enabled = false,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = nil, -- when nil, use defaults from documentation
					---@type NoiceViewOptions
					opts = {},  -- merged with defaults from documentation
				},

				message = {
					-- Messages shown by lsp servers
					enabled = false,
					view = "notify",
					opts = {},
				},
				-- defaults for hover and signature help
				documentation = {
					opts = {
						win_options = {
							winhighlight = {
								NormalFloat = "CmpDocFloat",
							},
						},
					},
				},
			},

			format = {
				spinner = {
					name = "circleFull",
				},
			},

			presets = {
				bottom_search = false,
				command_palette = false,
				long_message_to_split = true,
				lsp_doc_border = true,
				inc_rename = true,
			},

			views = {
				cmdline_popup = {
					position = {
						row = "50%",
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "rounded",
						padding = { 0, 0 },
					},

					win_options = {
						winhighlight = { Normal = "StatusLine", FloatBorder = "Keyword" },
					},
				},

				popupmenu = {
					enabled = true, -- enables the Noice popupmenu UI
					backend = "nui", -- backend to use to show regular cmdline completions
					relative = "editor",
					position = {
						row = "70%",
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 0 },
					},
					win_options = {
						winhighlight = { Normal = "StatusLine", FloatBorder = "Keyword" },
					},
				},

				commands = {
					history = {
						-- options for the message history that you get with `:Noice`
						view = "popup",
						opts = { enter = true, format = "details" },
						filter = {
							any = {
								{ event = "notify" },
								{ error = true },
								{ warning = true },
								{ event = "msg_show", kind = { "" } },
								{ event = "lsp",      kind = "message" },
							},
						},
					},
					win_options = {
						winhighlight = { Normal = "StatusLine", FloatBorder = "Keyword" },
					},
				},

				markdown = {
					hover = {
						["|(%S-)|"] = vim.cmd.help,                 -- vim help links
						["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
					},
					highlights = {
						["|%S-|"] = "@text.reference",
						["@%S+"] = "@parameter",
						["^%s*(Parameters:)"] = "@text.title",
						["^%s*(Return:)"] = "@text.title",
						["^%s*(See also:)"] = "@text.title",
						["{%S-}"] = "@parameter",
					},
				},
			},

			--	routes = {
			--		{
			--			view = "notify",
			--			filter = { event = "msg_showmode" },
			--		},
			--	},
		})
	end,
}
