return {
	"Wansmer/treesj",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local sj = require("treesj")

		sj.setup({
			use_default_keymaps = false,
			max_join_length = 180,
		})

		vim.keymap.set({ "n" }, "<leader>St", sj.toggle, { desc = "TreeSJ: Toggle" })
		vim.keymap.set({ "n" }, "<leader>Ss", sj.split, { desc = "TreeSJ: Split" })
		vim.keymap.set({ "n" }, "<leader>Sj", sj.join, { desc = "TreeSJ: Join" })
	end,
}
