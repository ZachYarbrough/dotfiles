vim.opt.wrap = false
vim.opt.shiftwidth = 4

-- Allows obsidian.nvim to conceal certain markdown formatting
vim.opt.conceallevel = 1

vim.opt.number = true
vim.opt.relativenumber = true

vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Moving visual selection
vim.keymap.set("v", "J", ":m \'>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m \'<-2<CR>gv=gv")

-- Keep cursor in the middle when jumping page blocks
vim.keymap.set("n", "<C-D>", "<C-d>zz")
vim.keymap.set("n", "<C-U>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "10jzz")
vim.keymap.set("n", "<C-u>", "10kzz")

-- Keep cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.cmd("filetype plugin indent on")

vim.opt.autoindent = true
vim.opt.smartindent = true


-- Highlight yanked text for better visual feedback
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end
})
