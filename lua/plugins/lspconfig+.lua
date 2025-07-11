return {
	{
		"neovim/nvim-lspconfig",
		event = "BufAdd",
		dependencies = {
			"nlsp-settings.nvim",
			--"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
		keys = {
			{ '[d',        '<cmd>lua vim.diagnostic.goto_prev()<cr>',   desc = "Prev diagnostic" },
			{ ']d',        '<cmd>lua vim.diagnostic.goto_next()<cr>',   desc = "Next diagnostic" },
			{ 'ga',        '<cmd>lua vim.lsp.buf.code_action()<cr>',    desc = "Code action" },
			{ 'gr',        '<cmd>lua vim.lsp.buf.rename()<cr>',         desc = "Rename" },
			{ 'gR',        '<cmd>lua vim.lsp.buf.references()<cr>',     desc = "References" },
			{ '<leader>F', '<cmd>lua vim.lsp.buf.format()<cr>',         desc = "Formatting" },
			--			{ 'gD',         '<cmd>lua vim.lsp.buf.declaration()<cr>',    desc = "Declaration" },
			--			{ 'gd',         '<cmd>lua vim.lsp.buf.definition()<cr>',     desc = "Definition" },
			{ 'K',         '<cmd>lua vim.lsp.buf.hover()<cr>',          desc = "Hover" },
			{ 'gi',        '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = "Implementation" },
			{ '<C-k>',     '<cmd>lua vim.lsp.buf.signature_help()<cr>', desc = "help" },
		},
		opts = {
			autoformat = false,
		},
		config = function()
			require('plugins.LSP.lspset')
		end
	},
	--
	{
		"tamago324/nlsp-settings.nvim",
		enabled = false,
		cmd = "LspSettings",
	},
}
