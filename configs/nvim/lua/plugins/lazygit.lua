return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gll", "<cmd>LazyGit<cr>", desc = "LazyGit: Open" },
		{ "<leader>glc", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit: Current file" },
		{ "<leader>glC", "<cmd>LazyGitConfig<cr>", desc = "LazyGit: Config" },
		{ "<leader>glf", "<cmd>LazyGitFilter<cr>", desc = "LazyGit: Filter" },
		{ "<leader>glF", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit: Filter current file" },
		{ "<leader>glL", "<cmd>LazyGitLog<cr>", desc = "LazyGit: Log" },
	},
}
