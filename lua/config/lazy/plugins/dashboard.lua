return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local db = require("dashboard")

    db.setup({
      theme = "hyper",
      config = {
        week_header = { enable = true },
        shortcut = {
          { desc = "  New File ", action = "enew", key = "n" },
          { desc = "  Find File ", group = "@function", action = "Telescope find_files", key = "p" },
          { desc = "  File Explorer ", group = "@function", action = "NvimTreeToggle", key = "e" },
          { desc = "  Quit ", action = "qa", key = "q" },
        },
      },
    })
  end,
}
