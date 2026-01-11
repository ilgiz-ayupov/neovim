vim.g.mapleader = " "

local map = vim.keymap.set

-- переход в normal mode
map("i", "jk", "<ESC>", { desc = "Перейти в Normal mode" })

-- перемещение строк/ блоков
map("n", "<M-j>", ":m .+1<CR>==", { desc = "Перемещение строки вниз", silent = true })
map("n", "<M-k>", ":m .-2<CR>==", { desc = "Перемещение строки вверх", silent = true })

map("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Перемещение блока вниз", silent = true })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Перемещение блока вверх", silent = true })

-- поиск
map("n", "<ESC>", ":nohl<CR>", { desc = "Очистить подсветку поиска", silent = true })

-- управление окнами
map("n", "<leader>sv", "<C-w>v", { desc = "Разделить окно вертикально" })
map("n", "<leader>sh", "<C-w>s", { desc = "Разделить окно горизонтально" })
map("n", "<leader>se", "<C-w>=", { desc = "Сделать окна одинакового размера" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Закрыть текущее окно" })

map("n", "<C-h>", "<C-w>h", { desc = "Перейти на левое окно" })
map("n", "<C-j>", "<C-w>j", { desc = "Перейти на нижнее окно" })
map("n", "<C-k>", "<C-w>k", { desc = "Перейти на верхнее окно" })
map("n", "<C-l>", "<C-w>l", { desc = "Перейти на правое окно" })

map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Уменьшить ширину окна" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Увеличить ширину окна" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Уменьшить высоту окна" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Увеличить высоту окна" })

-- Сохранять выделение при отступах
map("v", "<", "<gv", { desc = "Отступ влево" })
map("v", ">", ">gv", { desc = "Отступ вправо" })
