return {
	-- Catppuccin
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavor = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {},
			integrations = {
				cmp = true,
				gitsigns = true,
				neo_tree = true,
				treesitter = true,
				treesitter_context = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		},
	},

	-- TokyoNight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Everforest
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
	},

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},

	-- GitHub Theme
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
	},
	{ "rebelot/kanagawa.nvim" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{ "EdenEast/nightfox.nvim" },
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
	{
		"Mofiqul/vscode.nvim",
	},
}
