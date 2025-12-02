return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>e",
			"<cmd>Neotree toggle<CR>",
			desc = "Toggle Neo-tree file explorer",
			noremap = true,
			silent = true,
		},
	},
	init = function()
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	end,
	opts = {
		close_if_last_window = true,
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = true,
			},
		},
	},
}
