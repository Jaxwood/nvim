return {
  "olimorris/codecompanion.nvim",
  tag = "v19.7.0",
  opts = {
    adapters = {
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
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "claude-opus-4.5",
        },
      },
    },
    extensions = {
      mcphub = {
        callback = "mcphub.extensions.codecompanion",
        opts = {
          show_result_in_chat = true, -- Show mcp tool results in chat
          make_vars = false,           -- Convert resources to #variables
          make_slash_commands = true, -- Add prompts as /slash commands
        }
      },
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim"
  },
}
