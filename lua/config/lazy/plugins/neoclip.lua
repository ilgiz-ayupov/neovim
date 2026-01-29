return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "kkharji/sqlite.lua" },
  },
  config = function()
    require("neoclip").setup({
      history = 1000,
      enable_persistent_history = true,
      length_limit = 1048576,
      continuous_sync = true,
      db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
      filter = nil,
      preview = true,
      prompt = nil,
      default_register = '"',
      content_spec_column = false,
      on_paste = {
        set_reg = false,
      },
      keys = {
        telescope = {
          i = {
            select = "<cr>",
            paste = "<c-y>",
            paste_behind = nil,
            replay = "<c-q>",
            delete = "<c-d>",
            edit = "<c-e>",
            custom = {},
          },
          n = {
            select = "<cr>",
            paste = "<c-y>",
            paste_behind = nil,
            replay = "q",
            delete = "d",
            edit = "e",
            custom = {},
          },
        },
      },
    })

    require("telescope").load_extension("neoclip")
    vim.keymap.set("n", "<leader>y", "<cmd>Telescope neoclip<cr>", { desc = "Буфер обмена" })
  end,
}
