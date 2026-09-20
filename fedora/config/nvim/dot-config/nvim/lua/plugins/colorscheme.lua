return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    init = function()
      vim.o.background = "dark"
    end,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
