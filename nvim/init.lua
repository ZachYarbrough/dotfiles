
vim.g.mapleader = ' '

-- vim configs 
require('core.options')
require('core.keymaps')

-- plugins
vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin', lazy = false, priority = 1000 },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/ibhagwan/fzf-lua' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
})

-- color scheme
vim.cmd.colorscheme "catppuccin-macchiato"

-- fzf integration
require('fzf-lua').setup({
    defaults = {
	previewer = false,
	formatter = 'path.dirname_first'
    },
    winopts = {
	-- Shrink and move window to bottom left of screen
	width = 0.40,
	height = 0.35,

	row = 1.0,
	col = 0.0
    },
    files = {
	fzf_opts = {
	    ['--exact'] = '',
	    ['--no-sort'] = ''
	}
    },
    fzf_colors = {
	["pointer"] = "-1",
    }
})

-- git integration 

local signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    changedelete = { text = '±' },
    untracked    = { text = '?' },
}

require('gitsigns').setup({
    current_line_blame = true,

    signs = signs,
    signs_staged = signs
})
