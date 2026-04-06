return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "giuxtaposition/blink-cmp-copilot" },
		version = "1.*",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = false } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "copilot" },
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
					codecompanion = {
						name = "CodeCompanion",
						module = "codecompanion.providers.completion.blink",
						enabled = true,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust" },
		},
		opts_extend = { "sources.default" },
	},
}
