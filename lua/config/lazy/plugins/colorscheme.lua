return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    local ayu = require("ayu")

    ayu.setup({
      mirage = true,
      terminal = true,
      overrides = {
        -- Улучшенная подсветка для Normal mode
        Normal = { bg = "#1F2430", fg = "#CBCCC6" },
        NormalFloat = { bg = "#232834", fg = "#CBCCC6" },
        FloatBorder = { bg = "#232834", fg = "#5C6773" },

        -- Более контрастная строка с курсором
        CursorLine = { bg = "#242B38" },
        CursorLineNr = { fg = "#FFCC66", bold = true },
        LineNr = { fg = "#3E4B59" },

        -- Улучшенная подсветка для выделения
        Visual = { bg = "#273747" },
        VisualNOS = { bg = "#273747" },

        -- Подсветка для поиска
        Search = { bg = "#FFCC66", fg = "#1F2430", bold = true },
        IncSearch = { bg = "#FF7733", fg = "#1F2430", bold = true },
        CurSearch = { bg = "#FF7733", fg = "#1F2430", bold = true },

        -- Статусная строка
        StatusLine = { bg = "#1F2430", fg = "#CBCCC6" },
        StatusLineNC = { bg = "#1F2430", fg = "#5C6773" },

        -- Вертикальные разделители
        VertSplit = { fg = "#232834", bg = "#1F2430" },
        WinSeparator = { fg = "#232834", bg = "#1F2430" },

        -- Pmenu (меню автодополнения)
        Pmenu = { bg = "#232834", fg = "#CBCCC6" },
        PmenuSel = { bg = "#3E4B59", fg = "#FFCC66", bold = true },
        PmenuSbar = { bg = "#232834" },
        PmenuThumb = { bg = "#5C6773" },

        -- Tabs и буферы
        TabLine = { bg = "#1F2430", fg = "#5C6773" },
        TabLineFill = { bg = "#1F2430" },
        TabLineSel = { bg = "#242B38", fg = "#FFCC66", bold = true },

        -- Folding
        Folded = { bg = "#232834", fg = "#5C6773" },
        FoldColumn = { bg = "#1F2430", fg = "#3E4B59" },

        -- Sign column
        SignColumn = { bg = "#1F2430" },

        -- Git signs
        GitSignsAdd = { fg = "#86B300", bg = "#1F2430" },
        GitSignsChange = { fg = "#FFCC66", bg = "#1F2430" },
        GitSignsDelete = { fg = "#FF3333", bg = "#1F2430" },

        -- Диагностика LSP
        DiagnosticError = { fg = "#FF3333" },
        DiagnosticWarn = { fg = "#FFCC66" },
        DiagnosticInfo = { fg = "#5CCFE6" },
        DiagnosticHint = { fg = "#BAE67E" },

        DiagnosticVirtualTextError = { fg = "#FF3333", bg = "#2B1F1F" },
        DiagnosticVirtualTextWarn = { fg = "#FFCC66", bg = "#2B2A1F" },
        DiagnosticVirtualTextInfo = { fg = "#5CCFE6", bg = "#1F2630" },
        DiagnosticVirtualTextHint = { fg = "#BAE67E", bg = "#1F2B21" },

        -- Telescope
        TelescopeBorder = { fg = "#5C6773", bg = "#1F2430" },
        TelescopePromptBorder = { fg = "#5C6773", bg = "#1F2430" },
        TelescopeResultsBorder = { fg = "#5C6773", bg = "#1F2430" },
        TelescopePreviewBorder = { fg = "#5C6773", bg = "#1F2430" },
        TelescopeSelection = { bg = "#273747", fg = "#FFCC66", bold = true },
        TelescopeMatching = { fg = "#FF7733", bold = true },

        -- NvimTree
        NvimTreeNormal = { bg = "#1F2430", fg = "#CBCCC6" },
        NvimTreeEndOfBuffer = { bg = "#1F2430", fg = "#1F2430" },
        NvimTreeVertSplit = { fg = "#232834", bg = "#1F2430" },
        NvimTreeFolderName = { fg = "#5CCFE6" },
        NvimTreeFolderIcon = { fg = "#5CCFE6" },
        NvimTreeOpenedFolderName = { fg = "#5CCFE6", bold = true },
        NvimTreeRootFolder = { fg = "#FFCC66", bold = true },
        NvimTreeSpecialFile = { fg = "#FFAE57" },
        NvimTreeImageFile = { fg = "#D4BFFF" },
        NvimTreeIndentMarker = { fg = "#3E4B59" },

        -- Treesitter улучшения
        ["@variable"] = { fg = "#CBCCC6" },
        ["@variable.builtin"] = { fg = "#FF7733", italic = true },
        ["@function"] = { fg = "#FFD580" },
        ["@function.builtin"] = { fg = "#FFD580", bold = true },
        ["@function.call"] = { fg = "#FFD580" },
        ["@method"] = { fg = "#FFD580" },
        ["@method.call"] = { fg = "#FFD580" },
        ["@keyword"] = { fg = "#FF7733", italic = true },
        ["@keyword.function"] = { fg = "#FF7733", italic = true },
        ["@keyword.return"] = { fg = "#FF7733", bold = true, italic = true },
        ["@conditional"] = { fg = "#FF7733", italic = true },
        ["@repeat"] = { fg = "#FF7733", italic = true },
        ["@string"] = { fg = "#BAE67E" },
        ["@number"] = { fg = "#FFCC66" },
        ["@boolean"] = { fg = "#FFAE57" },
        ["@constant"] = { fg = "#D4BFFF" },
        ["@constant.builtin"] = { fg = "#D4BFFF", bold = true },
        ["@type"] = { fg = "#5CCFE6" },
        ["@type.builtin"] = { fg = "#5CCFE6", italic = true },
        ["@parameter"] = { fg = "#F29E74" },
        ["@property"] = { fg = "#73D0FF" },
        ["@comment"] = { fg = "#5C6773", italic = true },
        ["@punctuation.bracket"] = { fg = "#CBCCC6" },
        ["@punctuation.delimiter"] = { fg = "#CBCCC6" },
        ["@operator"] = { fg = "#FFAE57" },

        -- Indent-blankline
        IndentBlanklineChar = { fg = "#2D3640" },
        IndentBlanklineContextChar = { fg = "#3E4B59" },

        -- Illuminate подсветка
        IlluminatedWordText = { bg = "#273747" },
        IlluminatedWordRead = { bg = "#273747" },
        IlluminatedWordWrite = { bg = "#273747" },
      },
    })

    -- Включаем тему
    ayu.colorscheme()

    -- Дополнительная настройка после загрузки темы
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#232834", bg = "NONE" })
  end,
}
