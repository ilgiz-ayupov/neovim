local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local general = augroup("General", { clear = true })

-- ========= utils =========

local ignore_ft = {
  dashboard = true,
  NvimTree = true,
}

local function is_ignored(ft)
  return ignore_ft[ft] == true
end

-- ========= autocmds =========

-- Remove trailing whitespace
autocmd("BufWritePre", {
  group = general,
  desc = "Remove trailing whitespace on save",
  command = [[%s/\s\+$//e]],
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = general,
  desc = "Restore cursor position",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Enable treesitter features per-buffer
autocmd("FileType", {
  group = general,
  desc = "Enable treesitter features",
  callback = function(ev)
    local ft = ev.match
    local bufnr = ev.buf

    if is_ignored(ft) then
      return
    end

    -- если нет парсера — просто выходим
    if not pcall(vim.treesitter.start, bufnr) then
      return
    end
  end,
})
