return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- Провайдеры для подсветки (в порядке приоритета)
    providers = {
      "lsp",        -- Использовать LSP для поиска ссылок
      "treesitter", -- Использовать treesitter для поиска совпадений
      "regex",      -- Использовать regex как запасной вариант
    },
    -- Задержка перед подсветкой (миллисекунды)
    delay = 100,
    -- Типы файлов, для которых отключить подсветку
    filetypes_denylist = {
      "dirbuf",
      "dirvish",
      "fugitive",
      "NvimTree",
      "dashboard",
      "TelescopePrompt",
    },
    -- Режимы, в которых не подсвечивать
    modes_denylist = {},
    -- Минимальное количество совпадений для подсветки
    min_count_to_highlight = 1,
    -- Не подсвечивать слова длиной меньше указанной
    under_cursor = true,
    -- Размер буфера для поиска совпадений (в строках)
    large_file_cutoff = 2000,
    -- Не подсвечивать в больших файлах
    large_file_overrides = nil,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    -- Настройка цветов подсветки
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

    -- Keymaps для навигации между совпадениями
    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- Автоматически применять keymaps при открытии буфера
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
  end,
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}
