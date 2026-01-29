return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        AARRGGBB = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        tailwind = true,
        mode = "background", -- foreground | background | virtualtext
      },
      filetypes = {
        css = { css = true },
        scss = { css = true },
        html = { css = true },
      },
    })
  end,
}
