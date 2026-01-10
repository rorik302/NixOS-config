return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		vim.env.ESLINT_D_PPID = vim.fn.getpid()

		lint.linters_by_ft = {
			css = { "stylelint" },
			docker = { "hadolint" },
			html = { "htmlhint" },
			javascript = { "eslint_d" },
			markdown = { "markdownlint" },
			less = { "stylelint" },
			lua = { "selene" },
			nix = { "nix" },
			python = { "ruff", "mypy" },
			sass = { "stylelint" },
			scss = { "stylelint" },
			toml = { "tombi" },
			typescript = { "eslint_d" },
			yaml = { "yamllint" },
		}

		vim.api.nvim_create_autocmd({ "InsertLeave", "BufReadPost", "BufWritePost" }, {
			callback = function() lint.try_lint() end,
		})
	end,
}
