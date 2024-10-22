return {
	'hrsh7th/nvim-cmp',
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			version = "v2.*",
			config = function()
				local luasnip = require("luasnip")

				vim.api.nvim_create_autocmd("ModeChanged", {
					group = vim.api.nvim_create_augroup("luasnip.config", { clear = true }),
					pattern = { "i:n", "s:n" },
					callback = function(e)
						if
								luasnip.session
								and luasnip.session.current_nodes[e.buf]
								and not luasnip.session.jump_active
								and not luasnip.choice_active()
						then
							luasnip.active_update_dependents()
							luasnip.unlink_current()
						end
					end,
				})
			end,
		},
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-nvim-lua',
	},
	config = function()
		local cmp = require('cmp')
		local lspkind = require('lspkind')
		local luasnip = require("luasnip")
		cmp.setup {
			preselect = "None",
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
				end,
			},
			view = {
				entries = "custom", -- can be "custom", "wildmenu" or "native"
				selection_order = "top_down",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.config.disable,
				["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
				["<C-x>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.config.disable,
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'luasnip' },
				{
					-- See: https://github.com/hrsh7th/cmp-buffer#all-buffers
					name = "buffer",
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
				{ name = 'path' },
			}),
			formatting = {
				fields = {
					"kind",
					"abbr",
					"menu",
				},
				format = lspkind.cmp_format({
					mode = 'symbol', -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				})
			}
		}
	end
}
