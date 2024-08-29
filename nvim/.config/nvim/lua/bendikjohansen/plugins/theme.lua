return {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    opts = function()
	vim.o.termguicolors = true
	vim.o.background = 'dark'
	require('solarized').setup({
	    transparent = {
		enabled = true
	    }
	})
	vim.cmd.colorscheme 'solarized'
    end
}
