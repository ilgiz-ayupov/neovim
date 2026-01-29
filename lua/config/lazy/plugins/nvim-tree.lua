return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- иконки для файлов и папок
  },
  config = function()
    -- отключаем netrw, чтобы не конфликтовал с nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort_by = "case_sensitive", -- сортировка файлов по регистру
      view = {
        width = 45, -- ширина панели
        side = "left", -- сторона, где открывается дерево
        preserve_window_proportions = true, -- сохранять пропорции окна при изменении размеров
        number = false, -- показывать номера строк
        relativenumber = false, -- относительные номера
        signcolumn = "yes", -- показать колонку для значков git/diag
      },
      renderer = {
        root_folder_label = false, -- скрывать корневую папку в заголовке
        highlight_git = true, -- подсвечивать файлы по git статусу (цветовая индикация)
        highlight_opened_files = "all", -- подсвечивать все открытые файлы
        group_empty = false, -- не группировать пустые папки
        indent_markers = {
          enable = true, -- отображение вертикальных линий для структуры папок (как в VSCode)
          inline_arrows = true, -- стрелки в индентации
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          show = {
            file = true, -- показывать иконки файлов
            folder = true, -- показывать иконки папок
            folder_arrow = true, -- показывать стрелки у папок
            git = true, -- показывать git иконки (используется для подсветки, символы не отображаются)
          },
          glyphs = {
            default = "", -- иконка обычного файла
            symlink = "", -- иконка символической ссылки
            folder = {
              arrow_closed = "", -- стрелка ► для закрытой папки
              arrow_open = "", -- стрелка ▼ для открытой папки
              default = "", -- закрытая папка
              open = "", -- открытая папка
              empty = "", -- пустая закрытая папка
              empty_open = "", -- пустая открытая папка
              symlink = "", -- символическая ссылка на папку
            },
            git = {
              unstaged = "", -- пусто (используется только для подсветки цветом)
              staged = "", -- пусто
              unmerged = "", -- пусто
              renamed = "", -- пусто
              untracked = "", -- пусто
              deleted = "", -- пусто
              ignored = "", -- пусто
            },
          },
          padding = " ", -- прокладка между иконкой и названием
        },
        full_name = false, -- не показывать полный путь (экономит место)
      },
      filters = {
        dotfiles = false, -- показывать скрытые файлы
        custom = { "^.git$" }, -- скрывать папку .git
      },
      update_focused_file = {
        enable = true, -- автоматически фокусировать текущий открытый файл в дереве
        update_root = true, -- обновлять корневую папку при смене файла
        ignore_list = {}, -- список файлов/папок, которые игнорировать
      },
      git = {
        enable = true, -- включить интеграцию с git
        ignore = true, -- показывать файлы, указанные в .gitignore
        timeout = 500, -- таймаут на получение статуса git
      },
      actions = {
        open_file = {
          resize_window = true, -- менять размер окна при открытии файла
          quit_on_open = false, -- закрывать nvim-tree при открытии файла
          window_picker = {
            enable = true, -- включить выбор окна для открытия файла
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf" },
              buftype = { "terminal" },
            },
          },
        },
      },
      trash = {
        cmd = "trash", -- команда для перемещения в корзину
        require_confirm = true, -- запрос подтверждения перед удалением
      },
      system_open = {
        cmd = nil, -- если nil, будет использоваться системная команда по умолчанию
        args = {},
      },
      diagnostics = {
        enable = true, -- показывать LSP-диагностику рядом с файлами
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    })

    -- ============================================================================
    -- GIT STATUS HIGHLIGHTING (как в VSCode)
    -- ============================================================================

    local nvim_tree_highlight = vim.api.nvim_set_hl

    -- Модифицированные файлы (жёлтый цвет)
    nvim_tree_highlight(0, "NvimTreeGitModified", { fg = "#FDB813", bold = false })

    -- Добавленные файлы (зелёный цвет)
    nvim_tree_highlight(0, "NvimTreeGitNew", { fg = "#74C991", bold = false })

    -- Удалённые файлы (красный цвет)
    nvim_tree_highlight(0, "NvimTreeGitDeleted", { fg = "#F44747", bold = false })

    -- Неотслеживаемые файлы (синий цвет)
    nvim_tree_highlight(0, "NvimTreeGitUntracked", { fg = "#0097E6", bold = false })

    -- Переименованные файлы (фиолетовый цвет)
    nvim_tree_highlight(0, "NvimTreeGitRenamed", { fg = "#A166FF", bold = false })

    -- Конфликтующие файлы (оранжевый цвет)
    nvim_tree_highlight(0, "NvimTreeGitConflict", { fg = "#FF8C42", bold = true })

    -- Игнорируемые файлы (серый цвет)
    nvim_tree_highlight(0, "NvimTreeGitIgnored", { fg = "#808080", bold = false })

    -- Горячие клавиши
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
      silent = true,
      noremap = true,
      desc = "Открыть Файловый менеджер",
    })

    -- Автокоманда: если остался только nvim-tree, закрываем Neovim
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        -- Проверяем:
        -- 1. Есть только одно окно
        -- 2. Это окно - nvim-tree
        -- 3. Есть ещё открытые буферы (чтобы не закрыть Neovim при последнем буфере)
        local tree_utils = require("nvim-tree.utils")
        local buf_count = #vim.api.nvim_list_bufs()
        local win_count = #vim.api.nvim_list_wins()

        if win_count == 1 and tree_utils.is_nvim_tree_buf() and buf_count <= 1 then
          vim.cmd("quit")
        end
      end,
    })
  end,
}
