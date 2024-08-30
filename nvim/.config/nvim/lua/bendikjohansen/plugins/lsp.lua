return {
    {
	'williamboman/mason.nvim',

	-- lsp
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
    },
    {
	-- completion
	'hrsh7th/nvim-cmp',
	dependencies = {
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-cmdline',

	    -- snippet
	    'L3MON4D3/LuaSnip',
	    'saadparwaiz1/cmp_luasnip',
	},

	opts = function()
	    local cmp = require('cmp')

	    cmp.setup({
		expand = function(args)
		    require('luasnip').lsp_expand(args.body)
		end,
		window = {
		    completion = cmp.config.window.bordered(),
		    documentation = cmp.config.window.bordered()
		},
		mapping = cmp.mapping.preset.insert({
		    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		    ['<C-f>'] = cmp.mapping.scroll_docs(4),
		    ['<C-Space>'] = cmp.mapping.complete(),
		    ['<C-e>'] = cmp.mapping.abort(),
		    ['<CR>'] = cmp.mapping.confirm({ select = true }),
		    ['C-j'] = cmp.mapping.select_next_item(),
		    ['C-k'] = cmp.mapping.select_prev_item(),
		}),
		sources = cmp.config.sources(
		    {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }
		    },
		    {
			{ name = 'buffer' }
		    })
	    })

	    cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		    { name = 'buffer' }
		}
	    })

	    cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		    { name = 'path' }
		}, {
			{ name = 'cmdline' }
		    }),
		matching = { disallow_symbol_nonprefix_matching = false }
	    })

	    local capabilities = require('cmp_nvim_lsp').default_capabilities()
	    require('lspconfig')['omnisharp'].setup {
		capabilities = capabilities
	    }
	end
    }
}

