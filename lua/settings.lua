--[[ Переменные ]]
--
local opt = vim.opt

-- Глобальные переменные
local g = vim.g
local cmd = vim.cmd -- execute Vim commands
--local exec = vim.api.nvim_exec -- execute Vimscript

vim.o.mousemoveevent = true
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
g.formatoptions = "qrn1"
g.autoformat = false
--[[ Поиск ]]
--
-- Игнорировать регистр при поиске
-- Если теперь введем "IGNORE", то он найдет и "ignore"
opt.ignorecase = true

-- Не игнорировать регистр, если есть символы в верхнем регистре
-- Если напишем "Ignore", то он будет искать только "Ignore"
opt.smartcase = true

-- Подсвечивать найденные текстовые объекты
opt.showmatch = true

--[[ Настройка панелей ]]
--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
opt.splitright = true

opt.signcolumn = "yes"

-- Горизонтальные сплиты становятся снизу
opt.splitbelow = true

--[[ Настройка табов ]]
-- Используем табы по умолчанию
-- Иногда при <CR> создаются пробелы в виде табов. Это отвратительно, поэтому отменим данное поведение
opt.expandtab = false

-- Установка количества пробельных символов, когда сдвигаем с помощью "<", ">"
-- По сути не смотря на expandtab в терминале все равно отображаются пробельные символы, поэтому установим их количество на одно нажатие этих кнопок
opt.shiftwidth = 2

-- 1 таб == 2 пробела c новой строки
-- При нажатии <CR> будут вставлять табы. Табы рисуются как пробелы. Именно поэтому мы должны установить что каждый таб в новой строке - 4 пробела
opt.tabstop = 2

-- Подстраивать новые строки под предыдущий отступ
opt.smartindent = true
vim.opt.wrap = true -- Включить перенос строк
opt.showmode = false
opt.swapfile = false

vim.opt.encoding = "UTF-8"
--[[ Дополнительные настройки ]]
--
-- Используем системный буфер обмена
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Отключаем дополнение файлов в конце
opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
opt.completeopt = "menuone,noselect"

opt.shiftround = true
opt.smartindent = true             -- Instert indent automatically
opt.undolevels = 10000
opt.virtualedit = "block"          -- Allow cursor to move where there is not text in visual block mode
opt.wildmode = "longest:full,full" -- Command line completion mode
opt.smoothscroll = true

-- Подсветка строки с курсором
opt.cursorline = true

-- Нумерация строк
opt.number = true

-- Относительная нумерация строк
opt.relativenumber = true

-- Курсор всегда в центре экрана
opt.so = 999
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.mousescroll = "ver:1,hor:1"
opt.mousefocus = true

-- 24-bit RGB colors
opt.termguicolors = true

-- Blankline
opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.opt.whichwrap:append("<,>,[,],h,l")

opt.foldenable = true
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
--opt.foldmethod = "syntax"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = require("modules.foldtext")


--opt.winbar = " "
cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o") -- Отключить автоматическое комментирование при переходе на следующую строку
