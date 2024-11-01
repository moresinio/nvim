return {
	'saghen/blink.cmp',
	event = "InsertEnter",
	lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	dependencies = 'rafamadriz/friendly-snippets',

	-- use a release tag to download pre-built binaries
	version = 'v0.*',
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap. when defining your own, no keybinds will be assigned automatically.
		keymap = 'super-tab',

		highlight = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = true,
		},
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = 'mono',

		accept = {
			create_undo_point = true,
			auto_brackets = {
				enabled = true,
				default_brackets = { '(', ')' },
				override_brackets_for_filetypes = {},
				-- Overrides the default blocked filetypes
				force_allow_filetypes = {},
				blocked_filetypes = {},
				-- Synchronously use the kind of the item to determine if brackets should be added
				kind_resolution = {
					enabled = true,
					blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
				},
				-- Asynchronously use semantic token to determine if brackets should be added
				semantic_token_resolution = {
					enabled = true,
					blocked_filetypes = {},
					-- How long to wait for semantic tokens to return before assuming no brackets should be added
					timeout_ms = 400,
				},
			},
		},

		trigger = {
			completion = {
				-- 'prefix' will fuzzy match on the text before the cursor
				-- 'full' will fuzzy match on the text before *and* after the cursor
				-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
				keyword_range = 'full',
				-- regex used to get the text when fuzzy matching
				-- changing this may break some sources, so please report if you run into issues
				-- TODO: shouldnt this also affect the accept command? should this also be per language?
				keyword_regex = '[%w_\\-]',
				-- after matching with keyword_regex, any characters matching this regex at the prefix will be excluded
				exclude_from_prefix_regex = '[\\-]',
				-- LSPs can indicate when to show the completion window via trigger characters
				-- however, some LSPs (i.e. tsserver) return characters that would essentially
				-- always show the window. We block these by default
				blocked_trigger_characters = { ' ', '\n', '\t' },
				-- when true, will show the completion window when the cursor comes after a trigger character after accepting an item
				show_on_accept_on_trigger_character = true,
				-- when true, will show the completion window when the cursor comes after a trigger character when entering insert mode
				show_on_insert_on_trigger_character = true,
				-- list of additional trigger characters that won't trigger the completion window when the cursor comes after a trigger character when entering insert mode/accepting an item
				show_on_x_blocked_trigger_characters = { "'", '"', '(' },
				-- when false, will not show the completion window automatically when in a snippet
				show_in_snippet = true,
			},

			signature_help = {
				enabled = true,
				blocked_trigger_characters = {},
				blocked_retrigger_characters = {},
				-- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
				show_on_insert_on_trigger_character = true,
			},
		},

		sources = {
			-- list of enabled providers
			completion = {
				enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			-- Please see https://github.com/Saghen/blink.compat for using `nvim-cmp` sources
			providers = {
				lsp = {
					name = 'LSP',
					module = 'blink.cmp.sources.lsp',

					--- *All* of the providers have the following options available
					--- NOTE: All of these options may be functions to get dynamic behavior
					--- See the type definitions for more information
					enabled = true,         -- whether or not to enable the provider
					transform_items = nil,  -- function to transform the items before they're returned
					should_show_items = true, -- whether or not to show the items
					max_items = nil,        -- maximum number of items to return
					min_keyword_length = 0, -- minimum number of characters to trigger the provider
					fallback_for = {},      -- if any of these providers return 0 items, it will fallback to this provider
					score_offset = 0,       -- boost/penalize the score of the items
					override = nil,         -- override the source's functions
				},
				path = {
					name = 'Path',
					module = 'blink.cmp.sources.path',
					score_offset = 3,
					opts = {
						trailing_slash = false,
						label_trailing_slash = true,
						get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
						show_hidden_files_by_default = false,
					}
				},
				snippets = {
					name = 'Snippets',
					module = 'blink.cmp.sources.snippets',
					score_offset = -3,
					opts = {
						friendly_snippets = true,
						search_paths = { vim.fn.stdpath('config') .. '/snippets' },
						global_snippets = { 'all' },
						extended_filetypes = {},
						ignored_filetypes = {},
					}

					--- Example usage for disabling the snippet provider after pressing trigger characters (i.e. ".")
					-- enabled = function(ctx) return ctx ~= nil and ctx.trigger.kind == vim.lsp.protocol.CompletionTriggerKind.TriggerCharacter end,
				},
				buffer = {
					name = 'Buffer',
					module = 'blink.cmp.sources.buffer',
					fallback_for = { 'lsp' },
				},
			},
		},

		windows = {
			autocomplete = {
				min_width = 15,
				max_height = 10,
				border = 'rounded',
				winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
				-- keep the cursor X lines away from the top/bottom of the window
				scrolloff = 2,
				-- which directions to show the window,
				-- falling back to the next direction when there's not enough space
				direction_priority = { 's', 'n' },
				-- Controls whether the completion window will automatically show when typing
				auto_show = true,
				-- Controls how the completion items are selected
				-- 'preselect' will automatically select the first item in the completion list
				-- 'manual' will not select any item by default
				-- 'auto_insert' will not select any item by default, and insert the completion items automatically when selecting them
				selection = 'auto_insert',
				-- Controls how the completion items are rendered on the popup window
				-- 'simple' will render the item's kind icon the left alongside the label
				-- 'reversed' will render the label on the left and the kind icon + name on the right
				-- 'minimal' will render the label on the left and the kind name on the right
				-- 'function(blink.cmp.CompletionRenderContext): blink.cmp.Component[]' for custom rendering
				draw = 'reversed',
				-- Controls the cycling behavior when reaching the beginning or end of the completion list.
				cycle = {
					-- When `true`, calling `select_next` at the *bottom* of the completion list will select the *first* completion item.
					from_bottom = true,
					-- When `true`, calling `select_prev` at the *top* of the completion list will select the *last* completion item.
					from_top = true,
				},
			},
			documentation = {
				min_width = 10,
				max_width = 60,
				max_height = 20,
				border = 'rounded',
				winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
				-- which directions to show the documentation window,
				-- for each of the possible autocomplete window directions,
				-- falling back to the next direction when there's not enough space
				direction_priority = {
					autocomplete_north = { 'e', 'w', 'n', 's' },
					autocomplete_south = { 'e', 'w', 's', 'n' },
				},
				-- Controls whether the documentation window will automatically show when selecting a completion item
				auto_show = false,
				auto_show_delay_ms = 500,
				update_delay_ms = 50,
			},
			signature_help = {
				min_width = 1,
				max_width = 100,
				max_height = 10,
				border = 'rounded',
				winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
			},
			ghost_text = {
				enabled = true,
			},
		},
	}
}
