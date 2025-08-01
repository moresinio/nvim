return {
	'saghen/blink.cmp',
	enabled = true,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		'rafamadriz/friendly-snippets',
		"xzbdmw/colorful-menu.nvim",
	},
	version = 'v0.*',
	config = function()
		require('blink.cmp').setup({
			keymap = { preset = 'default' },

			cmdline = {
				enabled = true,
				completion = {
					menu = {
						auto_show = true,
					},
				},
			},
			signature = {
				enabled = true,
				window = {
					border = 'rounded',
				},
			},

		  sources = {
		  	default = { 'lsp', 'path', 'snippets', 'buffer' },
		  },

		  completion = {
		  	list = {
		  		selection = {
		  			auto_insert = true,
		  			preselect = true,
		  		},
		  	},
		  	documentation = {
		  		auto_show = false,
		  		auto_show_delay_ms = 666,
		  	},
		  	ghost_text = {
		  		enabled = true,
		  	},
		  	menu = {
		  		border = 'rounded',
		  		scrollbar = false,
		  		draw = {
		  			treesitter = { 'lsp' },

		  			-- We don't need label_description now because label and label_description are already
		  			-- conbined together in label by colorful-menu.nvim.
		  			columns = { { "kind_icon" }, { "label", gap = 1 } },
		  			components = {
		  				label = {
		  					text = require("colorful-menu").blink_components_text,
		  					highlight = require("colorful-menu").blink_components_highlight,
		  				},
		  			},
		  		},
		  	},
		  }
		})
	end
}

--[[

			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
				cmdline = {},
			},

			keymap = { preset = 'default' },

			signature = {
				enabled = true,
				window = {
					border = 'rounded',
				},
			},

			completion = {
				list = {
					selection = 'auto_insert',
				},
				menu = {
					border = 'rounded',
					scrollbar = false,
					draw = {
						treesitter = { 'lsp' },

						-- We don't need label_description now because label and label_description are already
						-- conbined together in label by colorful-menu.nvim.
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								text = require("colorful-menu").blink_components_text,
								highlight = require("colorful-menu").blink_components_highlight,
							},
						},
					},
				},
				documentation = {
					auto_show = false,
					auto_show_delay_ms = 666,
					window = {
						border = 'rounded',
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
]]
