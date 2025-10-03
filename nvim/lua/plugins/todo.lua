return {
    "ZachYarbrough/todo-list.nvim",
    config = function()
        -- Optional: define key mapping here, if not already inside the plugin
        vim.keymap.set('n', '<C-t>', function()
            require("todo-list").show_todos()
        end, { noremap = true, silent = true })
    end,
}
