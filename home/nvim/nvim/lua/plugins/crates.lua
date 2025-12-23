return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local crates = require("crates")
		crates.setup({})

		vim.keymap.set("n", "<leader>cu", crates.upgrade_crate, { desc = "Upgrade crate" })
		vim.keymap.set("n", "<leader>cU", crates.upgrade_all_crates, { desc = "Upgrade all crates" })
		vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "Show crate versions" })
		vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "Show crate features" })
		vim.keymap.set("n", "<leader>cd", crates.open_documentation, { desc = "Open crate docs" })
	end,
}
