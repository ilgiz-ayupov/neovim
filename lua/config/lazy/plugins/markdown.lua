return {
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("render-markdown").setup({
        heading = {
          sign = false,
          icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        },
        code = {
          sign = false,
          width = "block",
          border_pad = { 1, 1, 1, 1 },
        },
        dash = {
          width = 80,
        },
        bullet = {
          icons = { "●", "○", "◆", "◇" },
        },
        quote = {
          icon = "┃",
          repeat_linebreak = false,
        },
      })
    end,
    ft = { "markdown" },
  },
  {
    "godlygeek/tabular",
    cmd = { "Tabularize" },
    ft = { "markdown" },
  },
  {
    "preservim/vim-pencil",
    ft = { "markdown", "text" },
    config = function()
      vim.g.pencil_wrap = "soft"
      vim.g.pencil_textwidth = 80
      vim.g.pencil_conceallevel = 0
    end,
  },
}