return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      commands = {
        -- If item is a file it will close neotree after opening it.
        open_and_close_neotree = function(state)
          require("neo-tree.sources.filesystem.commands").open(state)

          local tree = state.tree
          local success, node = pcall(tree.get_node, tree)

          if not success then
            return
          end

          if node.type == "file" then
            require("neo-tree.command").execute({ action = "close" })
          end
        end,
      },
      window = {
        mappings = {
          ["<CR>"] = "open_and_close_neotree",
          ["<S-CR>"] = "open",
          ["<C-s>"] = { "scroll_preview", config = { direction = -10 } },
          ["<C-f>"] = "",
        },
      },
    },
  },
}
