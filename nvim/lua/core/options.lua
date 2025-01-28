
vim.opt.shiftwidth = 4
vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Highlight yanked text for better visual feedback
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end
})
