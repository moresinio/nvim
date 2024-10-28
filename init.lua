-- Импортируем основные настройки
require('settings')
require("autocmd")

-- Подключаем плагины
require("lazyIn")
--require("plugins.colorschemes")

require('mappings')

-- code

-- for telescope-fzf-native.nvim:
require("telescope").load_extension("fzf")
-- for telescope media files
require('telescope').load_extension('media_files')

require("telescope").load_extension("scope")

-- require('langmapper').automapping({ global = true, buffer = true })
-- end of init.lua
