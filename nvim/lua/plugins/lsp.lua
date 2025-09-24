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
	    vim.lsp.config('lua_ls', {
		capabilities = capabilities,
		settings = {
		    Lua = {
			diagnostics = {
			    globals = { 'vim' }
			}
		    }
		}
	    })

	    vim.lsp.config('ts_ls', {
		capabilities = capabilities
	    })

	    vim.lsp.config('gdscript', {
		capabilities = capabilities
	    })
	    -- Start godot server so it can interact with vim
	    vim.keymap.set('n', '<leader>sg', function() vim.fn.serverstart '127.0.0.1:6004' end, { noremap = true })

	    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

	    vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = false,
		float = true,
	    })
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

