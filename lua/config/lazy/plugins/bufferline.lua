return {
  "akinsho/bufferline.nvim",
  lazy = false,
  priority = 500,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- режим отображения: "buffers" (буферы) или "tabs" (вкладки)
        numbers = "none", -- номера: "none", "ordinal" (1,2,3...), "buffer_id"
        close_command = function(bufnum)
          -- Не закрывать последний буфер
          local buf_count = #vim.api.nvim_list_bufs()
          if buf_count <= 1 then
            vim.cmd("enew") -- создать новый пустой буфер
          end
          vim.cmd("bdelete! " .. bufnum)
        end,
        right_mouse_command = function(bufnum)
          -- ПКМ закрывает буфер
          local buf_count = #vim.api.nvim_list_bufs()
          if buf_count <= 1 then
            vim.cmd("enew")
          end
          vim.cmd("bdelete! " .. bufnum)
        end,
        left_mouse_command = "buffer %d", -- ЛКМ переключает на буфер
        middle_mouse_command = nil, -- СКМ (по умолчанию отключено)

        -- Диагностика LSP
        diagnostics = "nvim_lsp", -- источник диагностики ("nvim_lsp" или "coc")
        diagnostics_update_in_insert = false, -- обновлять ли диагностику в режиме вставки
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          -- как отображать количество ошибок/варнингов
          local icon = level:match("error") and " " or (level:match("warn") and " " or " ")
          return " " .. icon .. count
        end,

        -- Офсет для nvim-tree (файловый менеджер сбоку)
        offsets = {
          {
            filetype = "NvimTree", -- тип окна (именно так пишется)
            text = "File Explorer", -- текст в шапке
            highlight = "Directory", -- группа хайлайта
            text_align = "left", -- выравнивание текста ("left" | "center" | "right")
          },
        },

        groups = {
          items = {
            require("bufferline.groups").builtin.pinned:with({ icon = " 󰐃" }),
          },
        },

        -- Видимость элементов
        show_buffer_icons = true, -- показывать иконки файлов
        show_buffer_close_icons = false, -- показывать иконки закрытия буфера
        show_close_icon = false, -- показывать глобальную иконку закрытия справа
        show_tab_indicators = false, -- показывать индикаторы вкладок
        persist_buffer_sort = true, -- сохранять порядок буферов при перезапуске

        -- Ограничения на длину
        max_name_length = 18, -- макс. длина имени файла
        max_prefix_length = 15, -- макс. длина префикса (например, путь)
        truncate_names = true, -- обрезать длинные имена
        tab_size = 20, -- ширина таба

        -- Сортировка
        sort_by = "insert_after_current", -- варианты: "id", "extension", "relative_directory", "directory", "tabs", "insert_after_current"
      },
    })

    -- Горячие клавиши
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", {
      silent = true,
      noremap = true,
      desc = "Следующий буфер",
    })

    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", {
      silent = true,
      noremap = true,
      desc = "Предыдущий буфер",
    })

    vim.keymap.set("n", "<S-j>", ":BufferLinePick<CR>", {
      silent = true,
      noremap = true,
      desc = "Прыжок по буферам",
    })

    vim.keymap.set("n", "<S-x>", function()
      -- Безопасное закрытие буфера с переключением на соседний
      local current_buf = vim.api.nvim_get_current_buf()
      local buf_count = #vim.api.nvim_list_bufs()

      if buf_count <= 1 then
        -- Если это последний буфер, создаём новый и закрываем текущий
        vim.cmd("enew")
        vim.cmd("bdelete " .. current_buf)
      else
        -- Если есть другие буферы, переключаемся на них и закрываем текущий
        -- BufferLineCyclePrev переключит на предыдущий активный буфер
        vim.cmd("BufferLineCyclePrev")
        vim.cmd("bdelete " .. current_buf)
      end
    end, {
      silent = true,
      noremap = true,
      desc = "Закрыть буфер",
    })

    vim.keymap.set("n", "<S-p>", ":BufferLineTogglePin<CR>", {
      silent = true,
      noremap = true,
      desc = "Закрепить буфер",
    })

    vim.keymap.set("n", "<C-P>", ":BufferLineGroupClose ungrouped<CR>", {
      silent = true,
      noremap = true,
      desc = "Закрыть не закреплённые буферы",
    })
  end,
}
