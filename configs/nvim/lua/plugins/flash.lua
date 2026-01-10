return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	config = function()
		local flash = require("flash")

		flash.setup({ search = { mode = "search" } })

		vim.keymap.set({ "n", "x", "o" }, "f", function() flash.jump() end, { desc = "Flash: Jump" })
	end,
}
