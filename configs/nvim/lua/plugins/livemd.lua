return {
	"idossha/LiveMD.nvim",
	ft = { "markdown", "md" },
	cmd = { "LiveMDStart", "LiveMDStop" },
	config = function()
		require("livemd").setup()

		vim.keymap.set({ "n" }, "<leader>lms", ":LiveMDStart<cr>", { desc = "LiveMD: Start", noremap = true, silent = true })
		vim.keymap.set({ "n" }, "<leader>lmx", ":LiveMDStop<cr>", { desc = "LiveMD: Stop", noremap = true, silent = true })
	end,
}
