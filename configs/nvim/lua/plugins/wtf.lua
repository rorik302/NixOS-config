return {
	"piersolenski/wtf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim",
	},
	opts = {
		provider = "openai",
		providers = {
			openai = {
				url = "https://api.cerebras.ai/v1/chat/completions",
				api_key = vim.trim(vim.fn.system("cat ~/secrets/" .. "cerebras_api_key")),
				model_id = "gpt-oss-120b",
			}
		},
		language = "russian",
		picker = "snacks",
		popup_type = "vertical",
	},
	keys = {
		{ "<leader>wd", mode = { "n", "x" }, function() require("wtf").diagnose() end, desc = "Debug diagnostic with AI" },
		{ "<leader>wf", mode = { "n", "x" }, function() require("wtf").fix() end, desc = "Fix diagnostic with AI" },
		{ mode = { "n" }, "<leader>ws", function() require("wtf").search() end, desc = "Search diagnostic with Google" },
		{ mode = { "n" }, "<leader>wp", function() require("wtf").pick_provider() end, desc = "Pick provider" },
		{ mode = { "n" }, "<leader>wh", function() require("wtf").history() end, desc = "Populate the quickfix list with previous chat history" },
		{ mode = { "n" }, "<leader>wg", function() require("wtf").grep_history() end, desc = "Grep previous chat history with Telescope" },
	},
}
