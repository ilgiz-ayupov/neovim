return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local function lsp_status()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #clients == 0 then return "No LSP" end
      return table.concat(vim.tbl_map(function(c) return c.name end, clients), ", ")
    end
    return {
      options = {
        theme = "ayu_mirage",
        section_separators = "",
        component_separators = "|",
        icons_enabled = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = { "filename" },
        lualine_x = { lsp_status, "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      extensions = { "quickfix", "fugitive" },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
    -- Отключаем lualine для nvim-tree и dashboard
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "NvimTree", "dashboard" },
      callback = function()
        vim.opt.laststatus = 0
      end,
    })
    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype ~= "NvimTree" and vim.bo.filetype ~= "dashboard" then
          vim.opt.laststatus = 3
        end
      end,
    })
  end,
}
