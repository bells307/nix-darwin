-- Russian keyboard layout support
-- Maps Russian keys to English equivalents in normal, visual, and operator-pending modes

local function map_russian()
	local russian = 'йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ'
	local english = 'qwertyuiop[]asdfghjkl;\'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>'
	
	for i = 1, #russian do
		local ru_char = russian:sub(i, i)
		local en_char = english:sub(i, i)
		
		vim.keymap.set({'n', 'v', 'o'}, ru_char, en_char, { noremap = true, silent = true })
	end
end

map_russian()
