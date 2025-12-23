-- general options
vim.o.completeopt = "menu,menuone,popup,fuzzy" -- modern completion menu

vim.o.foldenable = true                        -- enable fold
vim.o.foldlevel = 99                           -- start editing with all folds opened
vim.o.foldmethod = "expr"                      -- use tree-sitter for folding method
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.o.clipboard = "unnamed"

-- NOTE: Setting vim options can be opinionated. While options above are crucial to make this whole config work as expected,
-- below are just list of options I think most users will satisfy.
-- Feel free to modify as your preference.

vim.o.termguicolors = true  -- enable rgb colors

vim.o.cursorline = true     -- enable cursor line

vim.o.number = true         -- enable line number
vim.o.relativenumber = true -- and relative line number

vim.o.signcolumn = "yes"    -- always show sign column

vim.o.pumheight = 10        -- max height of completion menu

vim.o.list = true           -- use special characters to represent things like tabs or trailing spaces
vim.opt.listchars = {       -- NOTE: using `vim.opt` instead of `vim.o` to pass rich object
	tab = "▏ ",
	trail = "·",
	extends = "»",
	precedes = "«",
}

vim.opt.diffopt:append("linematch:60") -- second stage diff to align lines

vim.o.confirm = true                   -- show dialog for unsaved file(s) before quit
vim.o.updatetime = 200                 -- save swap file with 200ms debouncing

vim.o.ignorecase = true                -- case-insensitive search
vim.o.smartcase = true                 -- , until search pattern contains upper case characters

vim.o.smartindent = true               -- auto-indenting when starting a new line
vim.o.shiftround = true                -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 4                   -- 0 to follow the 'tabstop' value
vim.o.tabstop = 4                      -- tab width

vim.o.undofile = true                  -- enable persistent undo
vim.o.undolevels = 10000               -- 10x more undo levels

-- remove netrw banner for cleaner looking
vim.g.netrw_banner = 0

vim.o.background = "dark"

-- auto-reload files when changed outside of vim
vim.o.autoread = true

-- trigger autoread when changing buffers or coming back to vim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	command = "checktime",
})

-- autosave configuration
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modifiable and vim.bo.modified and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.cmd("silent! write")
		end
	end,
})
