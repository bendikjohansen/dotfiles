return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = { "dprint", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "dprint", "markdownlint-cli2", "markdown-toc" },
      },
    },
  },
}
