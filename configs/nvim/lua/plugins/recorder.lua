return {
	"chrisgrieser/nvim-recorder",
	dependencies = { "rcarriga/nvim-notify", "nvim-lualine/lualine.nvim" },
	keys = {
		{ "<leader>q", desc = "Recorder: Start recording macro", noremap = true },
	},
	config = function()
		local recorder = require("recorder")

		recorder.setup({
			dynamicSlots = "rotate",
			mapping = { startStopRecording = "<leader>q" },
		})

		local lualineC = require("lualine").get_config().sections.lualine_c or {}

		table.insert(lualineC, { recorder.recordingStatus })
		table.insert(lualineC, { recorder.displaySlots })

		require("lualine").setup({ sections = { lualine_c = lualineC } })
	end,
}
