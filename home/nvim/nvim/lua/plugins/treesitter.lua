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
			ensure_installed = {
				"rust",
				"go",
				"lua",
				"vim",
				"vimdoc",
				"gitcommit",
				"git_rebase",
				"diff",
				"nix",
				"toml",
				"yaml",
				"json",
				"jsonc",
				"markdown",
				"markdown_inline",
				"bash",
				"regex",
				"comment",
			},
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
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
						-- Функции
						["af"] = "@function.outer",
						["if"] = "@function.inner",

						-- Классы
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",

						-- Параметры
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",

						-- Блоки
						["ab"] = "@block.outer",
						["ib"] = "@block.inner",

						-- Условия (if, match)
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",

						-- Циклы (for, while)
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",

						["at"] = "@attribute.outer",
						["am"] = "@comment.outer",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
						["]a"] = "@parameter.inner",
						["]b"] = "@block.outer",
						["]i"] = "@conditional.outer",
						["]l"] = "@loop.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
						["]C"] = "@class.outer",
						["]A"] = "@parameter.inner",
						["]B"] = "@block.outer",
						["]I"] = "@conditional.outer",
						["]L"] = "@loop.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
						["[a"] = "@parameter.inner",
						["[b"] = "@block.outer",
						["[i"] = "@conditional.outer",
						["[l"] = "@loop.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
						["[C"] = "@class.outer",
						["[A"] = "@parameter.inner",
						["[B"] = "@block.outer",
						["[I"] = "@conditional.outer",
						["[L"] = "@loop.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>sp"] = "@parameter.inner",
						["<leader>sf"] = "@function.outer",
						["<leader>sc"] = "@class.outer",
						["<leader>sb"] = "@block.outer",
					},
					swap_previous = {
						["<leader>sP"] = "@parameter.inner",
						["<leader>sF"] = "@function.outer",
						["<leader>sC"] = "@class.outer",
						["<leader>sB"] = "@block.outer",
					},
				},
				lsp_interop = {
					enable = true,
					border = "none",
					floating_preview_opts = {},
					peek_definition_code = {
						["<leader>df"] = "@function.outer",
						["<leader>dF"] = "@class.outer",
					},
				},
			},
		},
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy" },
}
