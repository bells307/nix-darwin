---@type vim.lsp.Config
return {
	cmd = { 'vscode-json-language-server', '--stdio' },
	filetypes = { 'json', 'jsonc' },
	root_markers = { '.git' },
	settings = {
		json = {
			format = {
				enable = true,
				indent = {
					tabSize = 2,
					insertSpaces = true,
				}
			},
			validate = { enable = true },
		},
	},
}
