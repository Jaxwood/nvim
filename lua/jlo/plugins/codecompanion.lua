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
		mcp = {
			servers = {
				["playwright"] = {
					cmd = { "npx", "@playwright/mcp@latest" },
				},
				["sysdig-mcp-server"] = {
					cmd = { "go", "run", "github.com/sysdiglabs/sysdig-mcp-server/cmd/server@latest" },
					env = {
						SYSDIG_MCP_API_HOST = "env:SYSDIG_MCP_API_HOST",
						SYSDIG_MCP_API_TOKEN = "env:SYSDIG_MCP_API_TOKEN",
						SYSDIG_MCP_TRANSPORT = "stdio",
					},
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
