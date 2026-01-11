return {
  "morhetz/gruvbox",
  lazy = false,
  config = function()
    -- Настройка темы
    vim.g.gruvbox_contrast_dark = "hard" -- варианты: "hard", "medium", "soft"
    vim.g.gruvbox_contrast_light = "soft" -- если используешь светлую тему
    vim.g.gruvbox_invert_selection = "0" -- не инвертировать выделение
    vim.g.gruvbox_italic = 1 -- включить курсив
    vim.g.gruvbox_bold = 1 -- включить жирный
    vim.g.gruvbox_underline = 1 -- включить подчёркивание
    vim.g.gruvbox_improved_warnings = 1 -- улучшенные подсказки/варнинги
    vim.g.gruvbox_improved_diff = 1 -- улучшенные диффы

    -- Включаем тему
    vim.cmd([[colorscheme gruvbox]])
  end,
}
