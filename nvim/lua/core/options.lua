
vim.opt.wrap = false
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd('filetype plugin indent on')

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.winborder = 'rounded'

vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = false -- Don't highlight search results

vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo

--------------------------------------
-- LSP Configuration 
--------------------------------------
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
                    '${3rd}/love2d/library',
                },
            },
	    diagnostics = {
		globals = { 'vim' },
	    },
	    telemetry = { enable = false },
        }
    }
})

vim.lsp.config('basedpyright', {
    settings = {
	basedpyright = {
	    typeCheckingMode = 'standard',
	}
    }
})

vim.lsp.enable({ 'lua_ls', 'ts_ls', 'basedpyright', 'jsonls' })

--------------------------------------

-- Configures the behavior of the insert mode completion menu
vim.opt.completeopt = 'menu,menuone,noselect,popup'
vim.o.autocomplete = true
-- Make omnicomplete reference the active LSP server for suggestions
vim.opt.complete:append('o')

-- Netrw Explorer
vim.g.netrw_liststyle = 3

-- Enable virtual text for in-line lsp warnings/errors
vim.diagnostic.config({
    virtual_text = true
})
