
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Moving visual selection
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Keep cursor in the middle when jumping page blocks
vim.keymap.set('n', '<C-d>', '10jzz')
vim.keymap.set('n', '<C-u>', '10kzz')

-- Keep cursor in the middle when searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Argument list (native Harpoon-like integration)
vim.keymap.set('n', '<leader>aa', function()
    vim.cmd('argadd %')
    vim.cmd('argdedup')
end)

vim.keymap.set('n', '<leader>ad', function()
    vim.cmd('argdelete %')
end)

vim.keymap.set('n', '<leader>1', function()
    vim.cmd('silent! 2argument')
end)

vim.keymap.set('n', '<leader>2', function()
    vim.cmd('silent! 3argument')
end)

vim.keymap.set('n', '<leader>3', function()
    vim.cmd('silent! 4argument')
end)

vim.keymap.set('n', '<leader>4', function()
    vim.cmd('silent! 5argument')
end)

vim.keymap.set('n', '<leader>5', function()
    vim.cmd('silent! 6argument')
end)

-- LSP keymaps
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'View quick definition' })

-- Love2D keymaps
vim.keymap.set('n', '<leader>vr', function()
    vim.cmd('silent! !love .')
end)

-- Plugin keymaps

--------------------------------------
-- gitsigns
--------------------------------------
vim.keymap.set('n', '<leader>ts', function()
    require('gitsigns').toggle_signs()
end, { desc = 'Toggle git signs' })

vim.keymap.set('n', '<leader>tb', function()
    require('gitsigns').toggle_current_line_blame()
end, { desc = 'Toggle git blame' })

vim.keymap.set('n', '<leader>gp', function()
    require('gitsigns').preview_hunk()
end, { desc = 'Preview hunk changes' })

vim.keymap.set('n', '<leader>gn', function()
    require('gitsigns').next_hunk()
end, { desc = 'Go to next hunk' })

--------------------------------------
-- fzf-lua
--------------------------------------
-- Options for centering the fzf window
local expanded_opts = {
    winopts = {
	fullscreen = true,
	preview = {
	    layout = 'vertical',
	    vertical = 'up:70%'
	}
    }

}

vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files()
end, { desc = 'Find files in current project' })

vim.keymap.set('n', '<leader>fg', function()
    require('fzf-lua').live_grep(vim.tbl_extend('force', expanded_opts, {
	previewer = 'builtin',
    }))
end, { desc = 'Grep for text in current project' })

vim.keymap.set('n', '<leader>fo', function()
    require('fzf-lua').oldfiles()
end, { desc = 'Browse recently opened files' })

vim.keymap.set('n', '<leader>fb', function()
    require('fzf-lua').buffers()
end, { desc = 'Browse open buffers' })

vim.keymap.set('n', '<leader>fa', function()
    require('fzf-lua').args()
end, { desc = 'Browse argslist' })

vim.keymap.set('n', '<leader>f.', function()
    require('fzf-lua').files({ cwd = '~/.dotfiles' })
end, { desc = 'Find files in dotfiles directory' })

vim.keymap.set('n', '<leader>fh', function()
    require('fzf-lua').help_tags()
end, { desc = 'Browse neovim\'s documentation' })

vim.keymap.set('n', '<leader>gt', function()
    require('fzf-lua').git_status(vim.tbl_extend('force', expanded_opts, {
	previewer = 'git_diff',
    }))
end, { desc = 'View git status' })
