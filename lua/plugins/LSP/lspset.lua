local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
	settings = {
		['clangd'] = {
		},
	},
}
require("clangd_extensions.inlay_hints").setup_autocmd()
require("clangd_extensions.inlay_hints").set_inlay_hints()

lspconfig.bashls.setup {
	settings = {
		['bashls'] = {
		},
	},
}
lspconfig.lua_ls.setup {
	settings = {
		['lua_ls'] = {
		},
	},
}
lspconfig.marksman.setup {
	settings = {
		['marksman'] = {
		},
	},
}

-- Enable rounded borders in :LspInfo window.
require("lspconfig.ui.windows").default_options.border = "rounded"

local signs = {
	Error = '',
	Warn = '',
	Hint = '',
	Info = '',
}
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

vim.diagnostic.config({
	virtual_text = false,
	--  	{
	--  	prefix = '󰀨 '
	--  },
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
	float = {
		border = 'rounded',
		source = 'always',
		header = '',
		prefix = '',
	},
})

-- vim.o.updatetime = 700
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	buffer = bufnr,
-- 	callback = function()
-- 		local opts = {
-- 			focusable = false,
-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
-- 			border = 'rounded',
-- 			source = 'always',
-- 			prefix = ' ',
-- 			scope = 'cursor',
-- 		}
-- 		vim.diagnostic.open_float(nil, opts)
-- 	end
-- })
