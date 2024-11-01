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
	},
	config = function()
		local cmp = require('cmp')
		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				-- completion = cmp.config.window.bordered(),
				-- documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<C-d>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			performance = {
				debounce = 60,
				throttle = 30,
				fetching_timeout = 500,
				filtering_context_budget = 3,
				confirm_resolve_timeout = 80,
				async_budget = 1,
				max_view_entries = 200,
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' }, -- For vsnip users.
				-- { name = 'luasnip' }, -- For luasnip users.
				-- { name = 'snippy' }, -- For snippy users.
				-- { name = 'ultisnips' }, -- For ultisnips users.
			}, {
				{ name = 'buffer' },
			})
		})
	end
}
