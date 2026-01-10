return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				javascript = { "prettierd" },
				kdl = { "kdlfmt" },
				less = { "prettierd" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				nix = { "nixfmt" },
				nginx = { "nginxfmt" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports", "black" },
				scss = { "prettierd" },
				sass = { "prettierd" },
				toml = { "tombi" },
				typescript = { "prettierd" },
				vue = { "prettierd" },
				yaml = { "prettierd" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
				return { timeout_ms = 500, lsp_format = "fallback" }
			end,
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, { desc = "Re-enable autoformat-on-save" })

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		vim.keymap.set({ "n", "v" }, "<leader>F", function()
			local current_buffer = vim.api.nvim_get_current_buf()
			conform.format({ bufnr = current_buffer })
		end, { desc = "Conform: Format" })
	end,
}
