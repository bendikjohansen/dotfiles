return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
	local theme = require('lualine.themes.gruvbox')

	vim.o.laststatus = vim.g.lualine_laststatus

    	require('lualine').setup({
	    options = { theme = theme },
	    globalstatus = true
	})
    end
}
