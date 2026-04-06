return {
	"olimorris/codecompanion.nvim",
	tag = "v19.9.0",
	opts = {
		adapters = {
			http = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "qwen2.5-coder:3b",
							},
						},
					})
				end,
			},
			acp = {
				copilot_acp = function()
					return require("codecompanion.adapters").extend("copilot_acp", {
						commands = {
							default = {
								"copilot",
								"--acp",
								"--stdio",
								"--allow-all",
							},
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				adapter = {
					name = "copilot",
					model = "claude-opus-4.5",
				},
			},
			inline = {
				adapter = {
					name = "copilot",
					model = "claude-opus-4.5",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
