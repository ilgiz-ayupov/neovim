vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- вкладки и отступы
opt.tabstop = 2 -- 2 пробела для табов
opt.shiftwidth = 2 -- 2 пробела для ширины отступа
opt.expandtab = true -- заменять табы пробелами
opt.autoindent = true -- копировать отступ текущей строки при создании новой

opt.wrap = false -- отключить перенос строк

-- настройки поиска
opt.ignorecase = true -- игнорировать регистр при поиске
opt.smartcase = true -- учитывать регистр, если в запросе есть заглавные буквы

opt.cursorline = true -- подсвечивать строку с курсором

-- включить true color (нужно для темы tokyonight)
-- требуется терминал с поддержкой 24-битного цвета (например, iTerm2)
opt.termguicolors = true
opt.background = "dark" -- использовать тёмную версию цветовых схем
opt.signcolumn = "yes" -- всегда показывать колонку знаков, чтобы текст не «прыгал»

-- backspace
opt.backspace = "indent,eol,start" -- разрешить backspace на отступе, конце строки и в начале insert-режима

-- буфер обмена
opt.clipboard:append("unnamedplus") -- использовать системный буфер обмена по умолчанию

-- разделение окон
opt.splitright = true -- вертикальные сплиты открываются справа
opt.splitbelow = true -- горизонтальные сплиты открываются снизу

-- отключить swap-файл
opt.swapfile = false

