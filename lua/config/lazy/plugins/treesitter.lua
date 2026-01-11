return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.install({
      "lua",
      "go",
      "bash",
      "dockerfile",
      "markdown",
      "json",
      "yaml",
      "toml",
    }, { summary = false }):wait(30000)
  end,
}
