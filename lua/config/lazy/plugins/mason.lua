return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- список серверов для установки
      ensure_installed = {
        "lua_ls",
        "gopls",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "stylua", -- lua formatter
        "gofumpt",
        "prettierd",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
