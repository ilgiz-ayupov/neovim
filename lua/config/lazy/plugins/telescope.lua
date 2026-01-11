return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-project.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",

        -- Улучшенный вид
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        -- Игнорируем ненужные файлы
        file_ignore_patterns = {
          "node_modules",
          "%.git/",
          "%.DS_Store",
          "target/",
          "build/",
          "dist/",
          "%.o",
          "%.a",
          "%.out",
          "%.class",
          "%.pdf",
          "%.mkv",
          "%.mp4",
          "%.zip",
        },

        -- Layout
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        sorting_strategy = "ascending",
        color_devicons = true,
        use_less = true,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        lsp_definitions = {
          theme = "cursor",
          layout_config = { width = 0.7, height = 0.4 },
        },
        lsp_references = {
          theme = "ivy",
          layout_config = { height = 0.3 },
        },
        lsp_implementations = {
          theme = "cursor",
          layout_config = { width = 0.7, height = 0.4 },
        },
        diagnostics = {
          theme = "ivy",
          layout_config = { height = 0.35 },
        },
      },
      extensions = {
        project = { hidden_files = true },
      },
    })

    -- Загружаем расширения
    pcall(telescope.load_extension, "project")
    pcall(telescope.load_extension, "fzf")

    -- Горячие клавиши
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>p", builtin.find_files, {
      silent = true,
      noremap = true,
      desc = "Поиск файла",
    })

    vim.keymap.set("n", "<leader>f", builtin.live_grep, {
      silent = true,
      noremap = true,
      desc = "Поиск текста",
    })

    vim.keymap.set("n", "<leader>t", ":TodoTelescope<CR>", {
      silent = true,
      noremap = true,
      desc = "Поиск todo-тегов",
    })

    vim.keymap.set("n", "gd", builtin.lsp_definitions, {
      silent = true,
      noremap = true,
      desc = "Перейти к определению",
    })

    vim.keymap.set("n", "gD", builtin.lsp_type_definitions, {
      silent = true,
      noremap = true,
      desc = "Перейти к определению типа",
    })

    vim.keymap.set("n", "gr", builtin.lsp_references, {
      silent = true,
      noremap = true,
      desc = "Перейти к ссылкам",
    })

    vim.keymap.set("n", "gi", builtin.lsp_implementations, {
      silent = true,
      noremap = true,
      desc = "Перейти к реализациям",
    })

    vim.keymap.set("n", "<S-d>", builtin.diagnostics, {
      silent = true,
      noremap = true,
      desc = "Диагностика по проекту",
    })
  end,
}
