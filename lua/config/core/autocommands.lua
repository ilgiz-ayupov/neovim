local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general_group = augroup("General", { clear = true })
local format_group = augroup("Format", { clear = true })

local ignored_filetypes = {
  dashboard = true,
  NvimTree = true,
  Trouble = true,
  TelescopePrompt = true,
}

local function is_ignored(ft)
  return ignored_filetypes[ft] == true
end

-- Удалять пробелы в конце строк при сохранении
autocmd("BufWritePre", {
  group = format_group,
  desc = "Remove trailing whitespace on save",
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Восстанавливать позицию курсора при открытии файла
autocmd("BufReadPost", {
  group = general_group,
  desc = "Restore cursor position",
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Включать treesitter для каждого буфера (оптимизировано)
autocmd("BufReadPost", {
  group = general_group,
  desc = "Enable treesitter features",
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype

    if is_ignored(ft) then
      return
    end

    -- Попытка запустить treesitter парсер
    if not pcall(vim.treesitter.start, ev.buf) then
      return
    end
  end,
})

-- Убирать пробелы и переводы строк при вставке из буфера обмена
autocmd("TextYankPost", {
  group = general_group,
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
