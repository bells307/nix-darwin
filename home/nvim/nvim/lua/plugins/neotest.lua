return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rouge8/neotest-rust",
		"mfussenegger/nvim-dap",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-rust")({
					args = { "--no-capture" },
					dap_adapter = "codelldb",
				}),
			},
			icons = {
				passed = "✓",
				running = "●",
				failed = "✗",
				unknown = "?",
				skipped = "⊘",
			},
			floating = {
				border = "rounded",
				max_height = 0.8,
				max_width = 0.9,
				options = {},
			},
			output = {
				enabled = true,
				open_on_run = true,
			},
			quickfix = {
				enabled = true,
				open = false,
			},
			status = {
				enabled = true,
				signs = true,
				virtual_text = true,
			},
			strategies = {
				integrated = {
					height = 40,
					width = 120,
				},
			},
		})

		-- Keymaps для тестирования
		vim.keymap.set("n", "<leader>tr", function()
			neotest.run.run()
		end, { desc = "Test: Run Nearest" })

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end, { desc = "Test: Run File" })

		vim.keymap.set("n", "<leader>ta", function()
			neotest.run.run(vim.fn.getcwd())
		end, { desc = "Test: Run All" })

		vim.keymap.set("n", "<leader>ts", function()
			neotest.summary.toggle()
		end, { desc = "Test: Toggle Summary" })

		vim.keymap.set("n", "<leader>to", function()
			neotest.output.open({ enter = true, auto_close = true })
		end, { desc = "Test: Show Output" })

		vim.keymap.set("n", "<leader>tO", function()
			neotest.output_panel.toggle()
		end, { desc = "Test: Toggle Output Panel" })

		vim.keymap.set("n", "<leader>tS", function()
			neotest.run.stop()
		end, { desc = "Test: Stop" })

		-- Отладка тестов
		vim.keymap.set("n", "<leader>td", function()
			neotest.run.run({ strategy = "dap" })
		end, { desc = "Test: Debug Nearest" })

		vim.keymap.set("n", "<leader>tD", function()
			neotest.run.run({ vim.fn.expand("%"), strategy = "dap" })
		end, { desc = "Test: Debug File" })

		-- Навигация по тестам
		vim.keymap.set("n", "[t", function()
			neotest.jump.prev({ status = "failed" })
		end, { desc = "Test: Jump to Previous Failed" })

		vim.keymap.set("n", "]t", function()
			neotest.jump.next({ status = "failed" })
		end, { desc = "Test: Jump to Next Failed" })

		-- Watch mode для автоматического запуска тестов
		vim.keymap.set("n", "<leader>tw", function()
			neotest.watch.toggle(vim.fn.expand("%"))
		end, { desc = "Test: Toggle Watch" })
	end,
}
