return {
	'nvim-treesitter/nvim-treesitter',
	event = "BufAdd",
	config = function()
		require 'nvim-treesitter.configs'.setup {

			-- Нужные парсеры
			ensure_installed = { "bash", "lua", "cmake", "vim", "css", "scss", "arduino", "json", "regex", "sql", "c", "cpp", "python", "markdown",
				"markdown_inline" },

			-- Устанавливать парсеры синхронно
			sync_install = false,

			-- Подсветка
			highlight = {
				-- Включить расшируение
				enable = true,
				disable = {},
			},

			indent = {
				-- Включить indent
				enable = false,
				disable = {},
			}
		}
	end
}
