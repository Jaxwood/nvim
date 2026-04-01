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
    interactions = {
      chat = {
        adapter = {
          name = "copilot_acp",
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
