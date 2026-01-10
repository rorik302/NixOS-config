return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Which-key: Buffer local keymaps" },
	},
	config = function()
		local wk = require("which-key")

		wk.setup({
			preset = "modern",
			win = {
				width = { min = 0.4, max = 0.5 },
				height = { min = 9, max = 25 },
			},
		})

		wk.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>d", group = "Diagnostic" },
			{ "<leader>f", group = "Find" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gg", group = "Gitsigns" },
			{ "<leader>gf", group = "Fugit2" },
			{ "<leader>gl", group = "Lazygit" },
			{ "<leader>m", group = "Multicursor" },
			{ "<leader>o", group = "Opencode" },
			{ "<leader>oP", group = "Opencode: Permissions" },
			{ "<leader>or", group = "Opencode: Revert/Restore" },
			{ "<leader>S", group = "TreeSJ" },
			{ "<leader>t", group = "Toggle" },
			{ "<leader>w", group = "WTF" },
		})
	end,
}
