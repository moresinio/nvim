-- Импортируем основные настройки
require('settings')

-- Подключаем плагины
require("lazyIn")
--require("plugins.colorschemes")

require('mappings')
require("autocmd")

 require('langmapper').automapping({ global = true, buffer = true })
-- end of init.lua
