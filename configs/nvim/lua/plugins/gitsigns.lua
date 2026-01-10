return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			numhl = true,
			attach_to_untracked = true,
			on_attach = function(bufnr)
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map({ "n" }, "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Gitsigns: Next hunk" })
				map({ "n" }, "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Gitsigns: Previous hunk" })

				map({ "n" }, "<leader>ggs", gitsigns.stage_hunk, { desc = "Gitsigns: Stage hunk" })
				map({ "n" }, "<leader>ggr", gitsigns.reset_hunk, { desc = "Gitsigns: Reset hunk" })
				map({ "v" }, "<leader>ggs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Gitsigns: Stage hunk (Visual)" })
				map({ "v" }, "<leader>ggr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Gitsigns: Reset hunk (Visual)" })
				map({ "n" }, "<leader>ggS", gitsigns.stage_buffer, { desc = "Gitsigns: Stage buffer" })
				map({ "n" }, "<leader>ggR", gitsigns.reset_buffer, { desc = "Gitsigns: Reset buffer" })
				map({ "n" }, "<leader>ggp", gitsigns.preview_hunk, { desc = "Gitsigns: Preview hunk" })
				map({ "n" }, "<leader>ggi", gitsigns.preview_hunk_inline, { desc = "Gitsigns: Preview hunk inline" })
				map({ "n" }, "<leader>ggb", function() gitsigns.blame_line({ full = true }) end, { desc = "Gitsigns: Blame line" })
				map({ "n" }, "<leader>ggd", gitsigns.diffthis, { desc = "Gitsigns: Diff" })
				map({ "n" }, "<leader>ggD", function() gitsigns.diffthis("~") end, { desc = "Gitsigns: Diff" })
				map({ "n" }, "<leader>ggQ", function() gitsigns.setqflist("all") end, { desc = "Gitsigns: Quickfix list" })
				map({ "n" }, "<leader>ggq", gitsigns.setqflist, { desc = "Gitsigns: Quickfix list" })
				map({ "n" }, "<leader>ggB", gitsigns.toggle_current_line_blame, { desc = "Gitsigns: Toggle current line blame" })
				map({ "n" }, "<leader>ggw", gitsigns.toggle_word_diff, { desc = "Gitsigns: Toggle word diff", noremap = true })
				map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Gitsigns: Select hunk" })
			end,
		})
	end,
}
