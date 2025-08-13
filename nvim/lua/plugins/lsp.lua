return {
    {
	'williamboman/mason.nvim',
	config = function()
	    require('mason').setup({})
	end
    },
    {
	'neovim/nvim-lspconfig',
	dependencies = {
	    'saghen/blink.cmp'
	},
	config = function()
	    local capabilities = require('blink.cmp').get_lsp_capabilities()
	    local lspconfig = require('lspconfig')
	    lspconfig.lua_ls.setup({ capabilities = capabilities })
	    lspconfig.ts_ls.setup({ capabilities = capabilities })

	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
	end
    },
    {
	'williamboman/mason-lspconfig.nvim',
	config = function()
	    require('mason-lspconfig').setup({
		ensure_installed = { 'lua_ls', 'ts_ls', 'tailwindcss', 'omnisharp' },
	    })
	end
    }
}

