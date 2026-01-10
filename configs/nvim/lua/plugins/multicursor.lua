return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		vim.keymap.set({ "n", "x" }, "<leader>mm", function() mc.lineAddCursor(1) end, { desc = "Multicursor: Set mark" })
		vim.keymap.set({ "n", "x" }, "<leader>mx", function()	mc.deleteCursor()	end, { desc = "Multicursor: Remove mark" })
		vim.keymap.set({ "n", "x" }, "<leader>mc", function()	mc.clearCursors()	end, { desc = "Multicursor: Clear all marks" })
	end,
}
