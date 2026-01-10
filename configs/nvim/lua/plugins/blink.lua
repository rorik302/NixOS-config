local list_opts = {
	selection = {
		preselect = false,
		auto_insert = false,
	},
}
local menu_opts = {
	auto_show = true,
	draw = {
		columns = {
			{ "kind_icon" },
			{ "label", "kind", gap = 1 },
		},
		components = {
			label = {
				text = function(ctx) return require("colorful-menu").blink_components_text(ctx) end,
				highlight = function(ctx) return require("colorful-menu").blink_components_highlight(ctx) end,
			},
		},
	},
}

return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		appearance = { nerd_font_variant = "mono" },
		cmdline = {
			enabled = true,
			keymap = { preset = "enter" },
			completion = {
				list = list_opts,
				menu = menu_opts,
			},
		},
		completion = {
			trigger = { show_on_insert_on_trigger_character = true },
			list = list_opts,
			menu = menu_opts,
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 1000,
			},
			ghost_text = { enabled = true },
			signature = { enabled = true },
		},
		sources = {
			default = { "lazydev", "lsp", "path", "buffer" },
			providers = {
				path = { opts = { get_cwd = function() return vim.fn.getcwd() end } },
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
