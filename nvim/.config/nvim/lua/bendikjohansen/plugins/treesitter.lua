return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",

    opts = function()
	local configs = require('nvim-treesitter.configs')

	configs.setup({
	    ensure_installed = { "c", "lua", "vim", "vimdoc", "typescript" },
	    sync_install = false,
	    highlight = { enable = true },
	    indent = { enable = true },
	})
    end
}
