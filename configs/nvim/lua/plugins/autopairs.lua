return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		local npairs = require("nvim-autopairs")
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")
		local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
		local log = require("nvim-autopairs._log")
		local utils = require("nvim-autopairs.utils")
		local ts_conds = require("nvim-autopairs.ts-conds")

		npairs.setup({ map_bs = false })

		-- Add spaces between parentheses
		npairs.add_rules({
			Rule(" ", " ")
				:with_pair(function(opts)
					local pair = opts.line:sub(opts.col - 1, opts.col)
					return vim.tbl_contains({
						brackets[1][1] .. brackets[1][2],
						brackets[2][1] .. brackets[2][2],
						brackets[3][1] .. brackets[3][2],
					}, pair)
				end)
				:with_move(cond.none())
				:with_cr(cond.none())
				:with_del(function(opts)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					local context = opts.line:sub(col - 1, col + 2)
					return vim.tbl_contains({
						brackets[1][1] .. "  " .. brackets[1][2],
						brackets[2][1] .. "  " .. brackets[2][2],
						brackets[3][1] .. "  " .. brackets[3][2],
					}, context)
				end),
		})
		for _, bracket in pairs(brackets) do
			npairs.add_rules({
				Rule(bracket[1] .. " ", " " .. bracket[2])
					:with_pair(cond.none())
					:with_move(function(opts)
						return opts.char == bracket[2]
					end)
					:with_del(cond.none())
					:use_key(bracket[2])
					:replace_map_cr(function(_)
						return "<C-c>2xi<CR><C-c>O"
					end),
			})
		end

		-- Insertion with surrounding check
		local function rule2(a1, ins, a2, lang)
			npairs.add_rule(Rule(ins, ins, lang)
				:with_pair(function(opts)
					return a1 .. a2 == opts.line:sub(opts.col - #a1, opts.col + #a2 - 1)
				end)
				:with_move(cond.none())
				:with_cr(cond.none())
				:with_del(function(opts)
					local col = vim.api.nvim_win_get_cursor(0)[2]
					return a1 .. ins .. ins .. a2 == opts.line:sub(col - #a1 - #ins + 1, col + #ins + #a2)
				end))
		end

		rule2("(", "*", ")", "ocaml")
		rule2("(*", " ", "*)", "ocaml")
		rule2("(", " ", ")")

		-- Move past commas and semicolons
		for _, punct in pairs({ ",", ";" }) do
			require("nvim-autopairs").add_rules({
				require("nvim-autopairs.rule")("", punct)
					:with_move(function(opts)
						return opts.char == punct
					end)
					:with_pair(function()
						return false
					end)
					:with_del(function()
						return false
					end)
					:with_cr(function()
						return false
					end)
					:use_key(punct),
			})
		end

		-- auto-pair <> for generics but not as greater-than/less-than operators
		npairs.add_rule(Rule("<", ">", {
			"-html",
			"-javascriptreact",
			"-typescriptreact",
		}):with_pair(cond.before_regex("%a+:?:?$", 3)):with_move(function(opts)
			return opts.char == ">"
		end))

		-- When typing space equals for assignment in Nix, add the final semicolon to the line
		local is_not_ts_node_comment_one_back = function()
			return function(info)
				log.debug("not_in_ts_node_comment_one_back")

				local p = vim.api.nvim_win_get_cursor(0)
				-- Subtract one to account for 1-based row indexing in nvim_win_get_cursor
				-- Also subtract one from the position of the column to see if we are at the end of a comment.
				local pos_adjusted = { p[1] - 1, p[2] - 1 }

				vim.treesitter.get_parser():parse()
				local target = vim.treesitter.get_node({ pos = pos_adjusted, ignore_injections = false })
				log.debug(target:type())
				if target ~= nil and utils.is_in_table({ "comment" }, target:type()) then
					return false
				end

				local rest_of_line = info.line:sub(info.col)
				return rest_of_line:match("^%s*$") ~= nil
			end
		end

		npairs.add_rule(Rule("= ", ";", "nix"):with_pair(is_not_ts_node_comment_one_back()):set_end_pair_length(1))
	end,
}
