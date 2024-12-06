return {
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp", -- Otherwise highlighting gets messed up
	event = "InsertEnter",
	dependencies = {
		{ "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
		{ "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
		{ "iguanacucumber/mag-buffer",   name = "cmp-buffer" },
		{ "iguanacucumber/mag-cmdline",  name = "cmp-cmdline" },
		{ "FelipeLema/cmp-async-path" },
		{ "L3MON4D3/LuaSnip" },
		{ 'saadparwaiz1/cmp_luasnip' }
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					--vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
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
			}),
			performance = {
				debounce = 60,
				throttle = 30,
				fetching_timeout = 500,
				filtering_context_budget = 3,
				confirm_resolve_timeout = 80,
				async_budget = 1,
				max_view_entries = 13,
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				-- { name = 'vsnip' }, -- For vsnip users.
				{ name = 'buffer' },
				{ name = 'luasnip' }, -- For luasnip users.
				{ name = 'async_path' },
				-- { name = 'snippy' }, -- For snippy users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
			})
		})
	end
}
