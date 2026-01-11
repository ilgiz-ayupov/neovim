local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Локальные биндинги для буфера.
    -- См. `:help vim.lsp.*` для документации по функциям ниже
    local opts = { buffer = ev.buf, silent = true }

    -- установка сочетаний клавиш
    opts.desc = "Показать ссылки LSP"
    keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Перейти к объявлению"
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Показать определение LSP"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)

    opts.desc = "Показать реализации LSP"
    keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Показать определения типов LSP"
    keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "Показать доступные действия кода"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Умное переименование"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Показать диагностику буфера"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Показать диагностику строки"
    keymap.set("n", "<leader>d", function()
      vim.diagnostic.open_float({ border = "rounded" })
    end, opts)

    opts.desc = "Перейти к предыдущей диагностике"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
    end, opts)

    opts.desc = "Перейти к следующей диагностике"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
    end, opts)

    opts.desc = "Показать документацию под курсором"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Перезапустить LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
  end,
})

-- Inline Hints
vim.lsp.inlay_hint.enable(true)

-- Diagnostics
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
