return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  config = function()
    require("ufo").setup()

    -- комбинации клавиш
    vim.keymap.set("n", "z", require("ufo").openAllFolds, { desc = "Открыть все блоки" })
    vim.keymap.set("n", "Z", require("ufo").closeAllFolds, { desc = "Свернуть все блоки" })
    vim.keymap.set("n", "zK", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Просмотр/hover под курсором" })
  end,
}
