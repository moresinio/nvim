--[[
mason.nvim is optimized to load as little as possible during setup.
Lazy-loading the plugin, or somehow deferring the setup, is not recommended.
]]
return {
	{
		"williamboman/mason.nvim",
		--event = "User FileOpened",
		event = "UIEnter",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
		config = function()
			require("mason").setup({
				ui = {
					border = 'rounded',
					height = 0.8,
				}
			})
		end,
	},
	--
	{
		"williamboman/mason-lspconfig.nvim",
		event = "User FileOpened",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "bashls", "marksman", }, -- "clangd",  "pyre", "lemminx",
				automatic_installation = true,
			})
		end,
	},
}
