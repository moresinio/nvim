return {
	'nvim-treesitter/nvim-treesitter',
	enabled = true,
	event = "BufAdd",
	config = function()
		require 'nvim-treesitter.configs'.setup {

			-- Нужные парсеры
			ensure_installed = { "bash", "lua", "cmake", "make", "meson", "vim", "css", "scss", "arduino", "json", "regex", "sql", "c", "cpp", "python", "markdown", "markdown", "markdown_inline", "sway", "tmux", "toml", "vim", "vimdoc", "diff", "fish", "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore", "ini", "qmljs" },

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
