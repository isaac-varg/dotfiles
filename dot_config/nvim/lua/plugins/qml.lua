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
            "-I",
            "/usr/lib/qt6/qml/Quickshell",
            "-I",
            "/usr/share/quickshell/qml",
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
              result.diagnostics = vim.tbl_filter(function(d)
                -- Filter out "is not creatable" warnings
                return not d.message:match("is not creatable")
              end, result.diagnostics)
              vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
            end,
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
