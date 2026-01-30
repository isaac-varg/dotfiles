return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "qmljs" })
    end,
  },

  -- Configure the QML language server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          enabled = true,
          cmd = {
            "qmlls",
            "-I",
            "/usr/lib/qt6/qml",
          },
        },
      },
    },
  },

  -- Associate .qml files with the qml filetype
  {
    "LazyVim/LazyVim",
    opts = {
      ft = {
        qml = { "qml" },
      },
    },
  },
}
