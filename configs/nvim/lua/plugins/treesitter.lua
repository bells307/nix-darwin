return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		config = function(_, opts)
			local install = require("nvim-treesitter.install")
			install.prefer_git = true
			install.compilers = { "clang", "cc", "gcc" }
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			ensure_installed = { "rust", "go" },
			sync_install = false,
			auto_install = true, -- можно оставить true — теперь будет git-клон

			highlight = { enable = true },
			indent = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<A-o>",
					node_incremental = "<A-o>",
					node_decremental = "<A-i>",
				},
			},

			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					include_surrounding_whitespace = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]A"] = "@parameter.inner",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sp"] = "@parameter.inner",
						["<leader>sf"] = "@function.outer",
						["<leader>sc"] = "@class.outer",
					},
					swap_previous = {
						["<leader>sP"] = "@parameter.inner",
						["<leader>sF"] = "@function.outer",
						["<leader>sC"] = "@class.outer",
					},
				},
			},
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy" },
}
