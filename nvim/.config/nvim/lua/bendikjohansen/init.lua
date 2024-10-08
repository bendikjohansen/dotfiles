require("bendikjohansen.config.vim")
require("bendikjohansen.config.lazy")
require("bendikjohansen.config.keymap")

require('mason').setup()
require('mason-lspconfig').setup()

require('lspconfig').lua_ls.setup {
    settings = {
	Lua = {
	    diagnostics = {
		globals = {'vim'}
	    }
	}
    }
}
require('lspconfig').ts_ls.setup {}
require('lspconfig').omnisharp.setup {}
