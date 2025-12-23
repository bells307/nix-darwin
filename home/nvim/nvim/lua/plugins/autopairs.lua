return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	dependencies = { "hrsh7th/nvim-cmp" },
	config = function()
		local autopairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")

		autopairs.setup({
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
				rust = { "string_literal", "raw_string_literal" },
				go = { "string_literal", "raw_string_literal" },
			},
			disable_filetype = { "TelescopePrompt", "vim" },
			disable_in_macro = false,
			disable_in_visualblock = false,
			disable_in_replace_mode = true,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
			enable_moveright = true,
			enable_afterquote = true,
			enable_check_bracket_line = true,
			enable_bracket_in_quote = true,
			enable_abbr = false,
			break_undo = true,
			check_comma = true,
			map_cr = true,
			map_bs = true,
			map_c_h = false,
			map_c_w = false,

			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		-- Автозакрытие | для closures
		autopairs.add_rules({
			Rule("|", "|", "rust")
				:with_pair(cond.not_after_regex("[%w]")) -- не после букв/цифр
				:with_move(cond.none()),

			Rule("<", ">", "rust"):with_pair(cond.before_regex("%a+")):with_move(function(opts)
				return opts.char == ">"
			end),
		})

		-- Интеграция с nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
