return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
    end,
    init = function()
      -- Disable conceal specifically for markdown files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "markdown.mdx" },
        callback = function()
          vim.opt_local.conceallevel = 0
        end,
      })
    end,
  },
}
