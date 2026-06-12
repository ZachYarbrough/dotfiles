vim.opt.wrap = false
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("filetype plugin indent on")

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Netrw Explorer
vim.g.netrw_liststyle = 3

-- Enable virtual text for in-line lsp warnings/errors
vim.diagnostic.config({
    virtual_text = true
})

-- Highlight yanked text for better visual feedback
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end
})
