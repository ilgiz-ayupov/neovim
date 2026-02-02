-- ============================================================================
-- LSP CONFIGURATION
-- ============================================================================

-- ============================================================================
-- LSP KEYMAPS
-- ============================================================================

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true, noremap = true }

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
    end

    -- ========== НАВИГАЦИЯ ==========

    map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Показать ссылки LSP")
    map("n", "gD", vim.lsp.buf.declaration, "Перейти к объявлению")
    map("n", "gd", vim.lsp.buf.definition, "Показать определение LSP")
    map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Показать реализации LSP")
    map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Показать определения типов LSP")

    -- ========== ДЕЙСТВИЯ С КОДОМ ==========

    map(
      { "n", "v" },
      "<leader>ca",
      vim.lsp.buf.code_action,
      "Показать доступные действия кода"
    )
    map("n", "<leader>rn", vim.lsp.buf.rename, "Умное переименование")

    -- ========== ДИАГНОСТИКА ==========

    map(
      "n",
      "<leader>D",
      "<cmd>Telescope diagnostics bufnr=0<CR>",
      "Показать диагностику буфера"
    )
    map("n", "<leader>d", function()
      vim.diagnostic.open_float({ border = "rounded" })
    end, "Показать диагностику строки")

    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
    end, "Перейти к предыдущей диагностике")

    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
    end, "Перейти к следующей диагностике")

    -- ========== ДОКУМЕНТАЦИЯ ==========

    map("n", "K", vim.lsp.buf.hover, "Показать документацию под курсором")

    -- ========== ПРОЧЕЕ ==========

    map("n", "<leader>rs", ":LspRestart<CR>", "Перезапустить LSP")
  end,
})

-- ============================================================================
-- INLINE HINTS
-- ============================================================================

vim.lsp.inlay_hint.enable(true)

-- ============================================================================
-- DIAGNOSTICS CONFIGURATION
-- ============================================================================

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = {
    severity = { min = severity.WARN }, -- показывать только warnings и errors
    prefix = "●", -- префикс для virtual text
  },
  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})
