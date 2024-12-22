return {
	'saghen/blink.cmp',
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = 'rafamadriz/friendly-snippets',
	version = 'v0.*',
	opts = {
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
	}
}
