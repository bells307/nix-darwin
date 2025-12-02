-- :h lsp-config

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
	callback = function(event)
		vim.diagnostic.config({
			virtual_text = true,
			underline = true,
			float = {
				border = "single", -- "single", "double", "shadow", "none"
			},
		})

		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
		end

		local fzf = require("fzf-lua")

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf, desc = "Go to definition" })
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Go to declaration" })
		vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { buffer = event.buf, desc = "Diagnostics (buffer)" })
		vim.keymap.set(
			"n",
			"<leader>fD",
			fzf.diagnostics_workspace,
			{ buffer = event.buf, desc = "Diagnostics (workspace)" }
		)
		vim.keymap.set("n", "gr", fzf.lsp_references, { buffer = event.buf, desc = "Go to references" })
		vim.keymap.set("n", "gI", fzf.lsp_implementations, { buffer = event.buf, desc = "Go to implentations" })
		vim.keymap.set("n", "gy", fzf.lsp_typedefs, { buffer = event.buf, desc = "Type definition" })
		vim.keymap.set("n", "<leader>fs", fzf.lsp_document_symbols, { buffer = event.buf, desc = "Document symbols" })
		vim.keymap.set("n", "<leader>fS", fzf.lsp_workspace_symbols, { buffer = event.buf, desc = "Workspace symbols" })
		vim.keymap.set("n", "<leader>fc", fzf.lsp_incoming_calls, { buffer = event.buf, desc = "Incoming calls" })
		vim.keymap.set("n", "<leader>fC", fzf.lsp_outgoing_calls, { buffer = event.buf, desc = "Outgoing calls" })

		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })
		vim.keymap.set("n", "<leader>ca", fzf.lsp_code_actions, { buffer = event.buf, desc = "Code action" })
		vim.keymap.set("i", "<a-cr>", fzf.lsp_code_actions, { buffer = event.buf, desc = "Code action" }) -- intellij like
		vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.refresh, { buffer = event.buf, desc = "CodeLens Refresh" })
		vim.keymap.set("n", "<leader>cR", vim.lsp.codelens.run, { buffer = event.buf, desc = "CodeLens Run" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover Documentation" })

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			vim.lsp.inlay_hint.enable(true)
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
			end, "Toggle Inlay Hints")
		end
	end,
})

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('taplo')
vim.lsp.enable('pyright')
vim.lsp.enable('jsonls')
vim.lsp.enable('nil_ls')
