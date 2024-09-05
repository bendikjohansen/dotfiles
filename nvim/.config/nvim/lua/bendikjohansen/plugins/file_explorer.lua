return {
    'stevearc/oil.nvim',
    opts = function()
	vim.keymap.set("n", "-", "<cmd>:Oil<cr>")
    end,
    dependencies = { { "echasnovski/mini.icons", opts = {} } }
}
