return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	version = "^1.0.0",
	init = function() vim.g.barbar_auto_setup = false end,
	config = function()
		require("barbar").setup({
			sidebar_filetypes = {
				snacks_layout_box = true,
			},
		})

		vim.keymap.set({ "n" }, "<leader>bb", ":BufferPick<cr>", { silent = true, desc = "Buffer: Pick" })
		vim.keymap.set({ "n" }, "<leader>bx", ":BufferClose<cr>", { silent = true, desc = "Buffer: Close" })
		vim.keymap.set({ "n" }, "<leader>bX", ":BufferCloseAllButCurrent<cr>", { silent = true, desc = "Buffer: Close All But Current" })
		vim.keymap.set({ "n" }, "<A-l>", ":BufferNext<cr>", { noremap = true, silent = true, desc = "Buffer: Next" })
		vim.keymap.set({ "n" }, "<A-h>", ":BufferPrevious<cr>", { noremap = true, silent = true, desc = "Buffer: Previous" })
	end,
}
