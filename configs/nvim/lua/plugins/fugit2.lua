return {
	"SuperBo/fugit2.nvim",
	build = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	cmd = { "Fugit2", "Fugit2Graph" },
	keys = {
		{ "<leader>gff", mode = { "n" }, "<cmd>Fugit2<cr>", desc = "Fugit2: Open" },
		{ "<leader>gfg", mode = { "n" }, "<cmd>Fugit2Graph<cr>", desc = "Fugit2: Open graph" },
		{ "<leader>gfd", mode = { "n" }, "<cmd>Fugit2Diff<cr>", desc = "Fugit2: Open diff" },
		{ "<leader>gfb", mode = { "n" }, "<cmd>Fugit2Blame<cr>", desc = "Fugit2: Show blame" },
	},
	config = function()
		local libgit2_path = function()
			local output = vim.trim(vim.fn.system("ls /nix/store | grep libgit2 | grep 'lib$'"))
			return "/nix/store/" .. output .. "/lib/libgit2.so"
		end

		require("fugit2").setup({
			libgit2_path = libgit2_path(),
		})
	end,
}
