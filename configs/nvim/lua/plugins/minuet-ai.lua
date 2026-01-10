local get_api_key = function(name)
	return vim.trim(vim.fn.system("cat ~/secrets/" .. name))
end

local cerebras_options = {
	openai_compatible = {
		api_key = function() return get_api_key("cerebras_api_key") end,
		name = "Cerebras",
		end_point = "https://api.cerebras.ai/v1/chat/completions",
		model = "gpt-oss-120b",
		optional = { max_completion_tokens = 1000 },
	},
}

return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("minuet").setup({
			virtualtext = {
				keymap = {
					accept = "<C-y>",
					accept_line = "<C-l>",
					accept_n_lines = "<C-h>",
					prev = "<C-k>",
					next = "<C-j>",
					dismiss = "<C-e>",
				},
				show_on_completion_menu = true,
			},
			throttle = 3000,
			debounce = 3000,
			provider = "openai_compatible",
			provider_options = cerebras_options,
		})
	end,
}
