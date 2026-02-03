return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      -- список серверов для установки
      -- ensure_installed = {
      --  "lua_ls",
      -- },
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
        "lua_ls",
        "stylua",
        "prettierd",
        "dockerls",
        "jsonls",
        "yamlls",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
}
