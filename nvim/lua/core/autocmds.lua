
-- Highlight yanked text for better visual feedback
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end
})


-- Toggle realtive and absolute line numbers
local number_toggle = vim.api.nvim_create_augroup('NumberToggle', { clear = true })

vim.api.nvim_create_autocmd({ 'CmdlineEnter', 'InsertEnter' }, {
    desc = 'Toggl absolute line numbers',
    group = number_toggle,
    pattern = '*',
    callback = function()
	if vim.wo.number then
	    vim.wo.relativenumber = false
	    vim.cmd.redraw()
	end
    end,
})

vim.api.nvim_create_autocmd({ 'CmdlineLeave', 'InsertLeave' }, {
    desc = 'Toggl relative line numbers',
    group = number_toggle,
    pattern = '*',
    callback = function()
	if vim.wo.number then
	    vim.wo.relativenumber = true
	    vim.cmd.redraw()
	end
    end,
})

--------------------------------------
-- Markdown Formatting 
--------------------------------------
-- Strike through and grey out - [-] tasks in markdown
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    desc = 'Strikethrough and grey out - [-] tasks in markdown',
    group = vim.api.nvim_create_augroup('markdown-strike-tasks', { clear = true }),
    pattern = { '*.md' },
    callback = function()
	vim.fn.matchadd('markdownStrike', '- \\[-\\].*')
	local comment = vim.api.nvim_get_hl(0, { name = 'Comment' })
	vim.api.nvim_set_hl(0, 'markdownStrike', {
	    fg = comment.fg,
	    strikethrough = true,
	})
    end,
})

-- Toggle concealment for symbols like bold (**), and inline code (```)
local conceal_toggle = vim.api.nvim_create_augroup('markdown-conceal', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
    desc = 'Show raw markdown in insert mode',
    group = conceal_toggle,
    pattern = { '*.md' },
    callback = function()
	vim.opt_local.conceallevel = 0
    end,
})

vim.api.nvim_create_autocmd({ 'BufEnter', "BufWinEnter", "InsertLeave" }, {
    desc = 'Hide markdown symbols',
    group = conceal_toggle,
    pattern = { '*.md' },
    callback = function()
	vim.opt_local.conceallevel = 2
    end,
})
