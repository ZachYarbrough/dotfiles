
vim.opt.wrap = false
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd("filetype plugin indent on")

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.winborder = "rounded"

-- Ignore case on search, unless typing uppercase characters 
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.lsp.config('lua_ls', {
    -- Root markers ensure it matches your game folders cleanly
    root_markers = { 'main.lua', '.git' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    "${3rd}/love2d/library",
                },
            },
        }
    }
})

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
