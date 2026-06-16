
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

-- Open diagnostic float on normal mode <leader>e
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Love2D keymaps
vim.keymap.set('n', '<leader>vr', function()
    vim.fn.jobstart({"love", "."}, { detach = true })
end)

-- Plugin keymaps

--------------------------------------
-- gitsigns 
--------------------------------------
local function gitsigns()
    return require('gitsigns')
end

vim.keymap.set('n', '<leader>ts', function()
    gitsigns().toggle_signs()
end, { desc = 'Toggle git signs' })

vim.keymap.set('n', '<leader>tb', function()
    gitsigns().toggle_current_line_blame()
end, { desc = 'Toggle git blame' })

vim.keymap.set('n', '<leader>gp', function()
    gitsigns().preview_hunk()
end, { desc = 'Preview hunk changes' })

vim.keymap.set('n', '<leader>gn', function()
    gitsigns().next_hunk()
end, { desc = 'Go to next hunk' })

--------------------------------------
-- fzf-lua
--------------------------------------
local function fzf()
    return require('fzf-lua')
end

local preview_opts = {
    layout = 'vertical',
    vertical = 'up:70%'
}

local expanded_opts = {
    winopts = {
        fullscreen = true,
        preview = preview_opts
    }
}

-- files
vim.keymap.set('n', '<leader>ff', function()
    fzf().files()
end, { desc = 'Find files in current project' })

vim.keymap.set('n', '<leader>fo', function()
    fzf().oldfiles()
end, { desc = 'Browse recently opened files' })

vim.keymap.set('n', '<leader>f.', function()
    fzf().files({ cwd = '~/.dotfiles' })
end, { desc = 'Find files in dotfiles directory' })

vim.keymap.set('n', '<leader>fn', function()
    fzf().files({ cwd = '~/Documents/notes', file_ignore_patterns = { 'archived/', 'assets/' } })
end, { desc = 'Find files in notes directory' })

-- grep
vim.keymap.set('n', '<leader>fg', function()
    fzf().live_grep(vim.tbl_extend('force', expanded_opts, {
	previewer = 'builtin',
    }))
end, { desc = 'Grep for text in current project' })

-- git
vim.keymap.set('n', '<leader>gt', function()
    fzf().git_status(vim.tbl_extend('force', expanded_opts, {
	previewer = 'git_diff',
    }))
end, { desc = 'View git status' })

vim.keymap.set('n', '<leader>gb', function()
    fzf().git_branches({ winopts = { preview = preview_opts } })
end, { desc = 'View git branches' })

-- misc
vim.keymap.set('n', '<leader>fb', function()
    fzf().buffers()
end, { desc = 'Browse open buffers' })

vim.keymap.set('n', '<leader>fa', function()
    fzf().args()
end, { desc = 'Browse argslist' })

vim.keymap.set('n', '<leader>fh', function()
    fzf().help_tags()
end, { desc = 'Browse neovim\'s documentation' })

