vim.keymap.set("n", "<leader>tb", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, { desc = "Toggle background between dark and light" })

vim.keymap.set("n", "<leader>tw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle word wrap" })

vim.api.nvim_set_keymap("v", "<C-u>", "<C-u>gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-d>", "<C-d>gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
