return {
    'stevearc/oil.nvim',
    opts = function()
	print("oil.lua opts was run")

	vim.keymap.set("n", "-", "<cmd>:Oil<cr>")
    end,
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
