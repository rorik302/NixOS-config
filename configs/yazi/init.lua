require("full-border"):setup()

require("fs-usage"):setup()

require("git"):setup()

require("relative-motions"):setup({
	show_numbers="absolute", 
	show_motion = true, 
	enter_mode ="first"
})

require("recycle-bin"):setup()

require("gvfs"):setup()

require("dupes"):setup {
	profiles = {
		-- Interactive mode: recursively scan and display duplicates
		interactive = {
			args = { "-r" },
		},
	},
}
