return {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
	require('bufferline').setup()

	local map = function(keys, func, desc)
	    vim.keymap.set('n', keys, func, { noremap = true, desc = 'BufferLine: ' .. desc})
	end

	map('<S-h>', '<Cmd>bprev<Cr>', 'Previous buffer')
	map('<S-l>', '<Cmd>bnext<Cr>', 'Next buffer')
	map('<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', 'Delete buffers to the left')
	map('<leader>br', '<Cmd>BufferLineCloseRight<CR>', 'Delete buffers to the right')
	map('<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', 'Delete other buffers')
	map('<leader>bd', '<Cmd>:bd<CR>', 'Delete buffer')
    end
}
