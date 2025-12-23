return {
	{
		"echasnovski/mini.files",
		version = "*",
		keys = {
			{
				"<leader>fm",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
				end,
				desc = "Open mini.files in buffer directory",
			},
		},
		opts = {
			windows = {
				preview = true,
				width_focus = 30,
				width_preview = 30,
			},
			options = {
				use_as_default_explorer = true,
			},
		},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "ma",
				delete = "md",
				find = "mf",
				find_left = "mF",
				highlight = "mh",
				replace = "mr",
				update_n_lines = "mn",
			},
		},
	},
}
