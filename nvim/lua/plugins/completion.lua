return { 
    {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',

	version = '*',

	opts = {
	    keymap = { preset = 'default' },

	    completion = {
		menu = {
		    draw = {
			treesitter = { "lsp" },
		    }
		},
		documentation = {
		    auto_show = true,
		    auto_show_delay_ms = 200,
		},
	    },
	    appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = 'mono'
	    },
	},
	opts_extend = { "sources.default" },
	signature = { enable = true }
    },
    {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
	    require("nvim-surround").setup({ })
	end
    }
}
