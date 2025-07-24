return {
  {
    "rafaelsq/nvim-goc.lua",
    lazy = true,
    keys = {
      { "<leader>gcf", desc = "Go coverage for file" },
      { "<leader>gcc", desc = "Clear Go coverage" },
    },
    opts = {
      verticalSplit = true, -- default to horizontal split
    },
    config = function(_, opts)
      -- Recommended setting for buffer switching
      vim.opt.switchbuf = "useopen"

      local goc = require("nvim-goc")
      goc.setup(opts)

      -- Set up keybindings
      vim.keymap.set("n", "<leader>gcf", goc.Coverage, { silent = true, desc = "Go coverage for file" })
      vim.keymap.set("n", "<leader>gcc", goc.ClearCoverage, { silent = true, desc = "Clear Go coverage" })
    end,
  },
}
