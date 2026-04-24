return {
	"olimorris/codecompanion.nvim",
	tag = "v19.12.0",
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
					model = "claude-opus-4.6",
				},
			},
			inline = {
				adapter = {
					name = "copilot",
					model = "claude-opus-4.6",
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
