return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Files",
		},
		{
			"<leader>f.",
			function()
				require("fzf-lua").files({ cwd = vim.fn.expand("%:p:h") })
			end,
			desc = "Files (current buffer directory)",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").helptags()
			end,
			desc = "Help tags",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles()
			end,
			desc = "Old files",
		},
		{
			"<leader>fj",
			function()
				require("fzf-lua").jumps()
			end,
			desc = "Jumps",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fG",
			function()
				require("fzf-lua").git_status()
			end,
			desc = "Git status",
		},
	},
	opts = {
		fzf_colors = {
			["fg"] = { "fg", "Normal" },
			["bg"] = { "bg", "Normal" },
			["hl"] = { "fg", "Comment" },
			["fg+"] = { "fg", "Normal" },
			["bg+"] = { "bg", "CursorLine" },
			["hl+"] = { "fg", "Function" },
			["info"] = { "fg", "Type" },
			["prompt"] = { "fg", "Identifier" },
			["pointer"] = { "fg", "DiagnosticHint" },
			["marker"] = { "fg", "Keyword" },
			["spinner"] = { "fg", "Label" },
			["header"] = { "fg", "Comment" },
			["border"] = { "fg", "FloatBorder" },
		},
	},
}
