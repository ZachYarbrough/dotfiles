
vim.opt.wrap = false
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("filetype plugin indent on")

vim.opt.autoindent = true
vim.opt.smartindent = true

-- Ignore case on search, unless typing uppercase characters 
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- LSP Config
vim.lsp.enable({ 'lua_ls', 'ts_ls', 'pyright' })

-- Configures the behavior of the insert mode completion menu
vim.opt.completeopt = "menu,menuone,noselect,popup"
vim.o.autocomplete = true
-- Make omnicomplete reference the active LSP server for suggestions
vim.opt.complete:append("o")

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
