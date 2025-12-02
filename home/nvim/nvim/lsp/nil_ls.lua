---@type vim.lsp.Config
return {
	cmd = { "nil" },
	root_dir = vim.fs.dirname(vim.fs.find({ "flake.nix", ".git" }, { upward = true })[1]),
	filetypes = { "nix" },
	settings = {
		["nil"] = {
			formatting = {
				command = { "nixfmt" },
			},
		},
	},
}
