local lspconfig = require('lspconfig')

--lspconfig.clangd.setup {
--	settings = {
--		['clangd'] = {
--			InlayHints = {
--				Enabled = true,
--			}
--		},
--	},
--}

--require("clangd_extensions.inlay_hints").setup_autocmd()
--require("clangd_extensions.inlay_hints").set_inlay_hints()

lspconfig.bashls.setup {
	settings = {
		['bashls'] = {
		},
	},
}

lspconfig.pyright.setup {
	settings = {
		['pyright'] = {
		},
	},
}

--lspconfig.cssls.setup {
--	settings = {
--		['cssls'] = {
--		},
--	},
--}

--lspconfig.lua_ls.setup {
--	settings = {
--		['lua_ls'] = {
--		},
--	},
--}

--lspconfig.marksman.setup {
--	settings = {
--		['marksman'] = {
--		},
--	},
--}

local util = require 'lspconfig.util'
lspconfig.arduino_language_server.setup {
	settings = {
		['arduino_language_server'] = {
		},
	},
	filetypes = { "arduino", },
	--	root_dir = util.root_pattern '*.ino',
	-- capabilities = {
	-- 	textDocument = {
	-- 		semanticTokens = vim.NIL
	-- 	},
	-- 	workspace = {
	-- 		semanticTokens = vim.NIL
	-- 	}
	-- },
	--cmd = {
	--	"arduino-language-server",
	--		"-cli-config", "/home/rengoku/.arduino15/arduino-cli.yaml",
	--		"-fqbn", "arduino:avr:nano",
	--		"-cli", "/usr/bin/arduino-cli",
	--	"-clangd", "/home/rengoku/.local/share/nvim/mason/packages/clangd/clangd_19.1.2/bin/clangd",
	--}
}

--local signs = {
--	Error = '',
--	Warn = '',
--	Hint = '',
--	Info = '',
--}
--for type, icon in pairs(signs) do
--	local hl = "DiagnosticSign" .. type
--	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--end


vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{ border = 'rounded' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
	vim.lsp.handlers.signature_help,
	{ border = 'rounded' }
)

vim.diagnostic.config {
	virtual_text = false,
	virtual_line = false,
	float = {
		focusable = false,
		style = 'minimal',
		border = 'rounded',
		source = "always",
		header = '',
		prefix = '',
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
	underline = true,
	jump = {
		float = true,
	},
}
