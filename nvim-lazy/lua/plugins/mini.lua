return {
    {
        'nvim-mini/mini.comment',
        version = '*',
        config = function()
            require('mini.comment').setup()
        end,
    },
    {
        'nvim-mini/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup()
        end,
    },
}
