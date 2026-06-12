
vim.g.mapleader = ' '

-- vim configs 
require('core.options')
require('core.keymaps')

-- plugins
vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin', lazy = false, priority = 1000 },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
})

-- color scheme
vim.cmd.colorscheme "catppuccin-macchiato"

-- lsp config
vim.lsp.enable({ 'lua_ls', 'ts_ls', 'pyright' })

-- fzf integration
require('fzf-lua').setup({
    defaults = {
	formatter = 'path.dirname_first'
    }
})

