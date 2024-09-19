return {
    {
	'MeanderingProgrammer/render-markdown.nvim',
	opts = {},
	dependencies = {
	    'nvim-treesitter/nvim-treesitter',
	    'echasnovski/mini.icons'
	},
    },
    {
	"epwalsh/obsidian.nvim",
	version = '*',
	lazy = true,
	ft = 'markdown',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    'hrsh7th/nvim-cmp',
	},
	ui = {
	    enable = false
	},
	mappings = {
	    ['gf'] = {
		action = function()
		    return require('obsidian').util.gf_passthrough()
		end,
		opts = { noremap = false, expr = true, buffer = true }
	    }
	},
	['<leader>ch'] = {
	    action = function ()
		return require('obsidian').util.toggle_checkbox()
	    end
	}
    }
}
