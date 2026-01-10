return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		explorer = {
			enabled = true,
			replace_netrw = true,
			trash = true,
		},
		input = { enabled = true },
		notifier = { enabled = true, timeout = 3000 },
		picker = {
			enabled = true,
			include = { "*" },
			layout = { cycle = false },
		},
	},
	keys = {
		{ "<leader>e", mode = { "n" }, function() Snacks.picker.explorer() end, desc = "Snacks: Toggle Explorer" },
		{ "<leader>fb", mode = { "n" }, function() Snacks.picker.buffers() end, desc = "Snacks: Find buffer" },
		{ "<leader>ff", mode = { "n" }, function() Snacks.picker.files() end, desc = "Snacks: Find file" },
		{ "<leader>fg", mode = { "n" }, function() Snacks.picker.grep() end, desc = "Snacks: Find grep" },
		{ "<leader>fh", mode = { "n" }, function() Snacks.picker.help() end, desc = "Snacks: Find help" },
		{ "<leader>fH", mode = { "n" }, function() Snacks.picker.highlights() end, desc = "Snacks: Find highlight" },
		{ "<leader>fi", mode = { "n" }, function() Snacks.picker.icons() end, desc = "Snacks: Find icon" },
		{ "<leader>fk", mode = { "n" }, function() Snacks.picker.keymaps() end, desc = "Snacks: Find keymap" },
		{ "<leader>fn", mode = { "n" }, function() Snacks.notifier.show_history() end, desc = "Snacks: Show notifications" },
		{ "<leader>fN", mode = { "n" }, function() Snacks.picker.notifications() end, desc = "Snacks: Open notifications" },
	},
	config = function(_, opts)
		require("snacks").setup(opts)

		-- Toggles
		Snacks.toggle.diagnostics():map("<leader>td")
		Snacks.toggle.inlay_hints():map("<leader>th")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>tw")
		Snacks.toggle.option("number", { name = "Number" }):map("<leader>tl")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>tL")
	end,
}
