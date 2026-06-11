
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
vim.keymap.set('n', '<leader>h', function()
    vim.cmd.args()
end)

vim.keymap.set('n', '<leader>ha', function()
    vim.cmd('argadd %')
    vim.cmd('argdedup')
end)

vim.keymap.set('n', '<leader>hd', function()
    vim.cmd('argdelete %')
end)

vim.keymap.set('n', '<leader>1', function()
    vim.cmd('silent! 1argument')
end)

vim.keymap.set('n', '<leader>2', function()
    vim.cmd('silent! 2argument')
end)

vim.keymap.set('n', '<leader>3', function()
    vim.cmd('silent! 3argument')
end)

vim.keymap.set('n', '<leader>4', function()
    vim.cmd('silent! 4argument')
end)

vim.keymap.set('n', '<leader>5', function()
    vim.cmd('silent! 5argument')
end)

-- Plugin keymappings

-- fzf-lua
vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files()
end)

vim.keymap.set('n', '<leader>fg', function()
    require('fzf-lua').live_grep()
end)
