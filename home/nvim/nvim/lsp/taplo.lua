---@type vim.lsp.Config
return {
	cmd = { 'taplo', 'lsp', 'stdio' },
	filetypes = { 'toml' },
	root_markers = { 'Cargo.toml', '.git' },
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '', {
			noremap = true,
			silent = true,
			callback = function()
				if vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
					require('crates').show_popup()
				else
					vim.lsp.buf.hover()
				end
			end,
			desc = 'Show Crate Documentation',
		})
	end,
	single_file_support = true,
}
