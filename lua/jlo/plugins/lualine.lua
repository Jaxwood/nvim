return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "franco-ruggeri/codecompanion-lualine.nvim", },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          {
            "filename",
            path = 3,
          }
        },
        lualine_x = { "codecompanion" },
        lualine_y = { "encoding", "fileformat", "filetype" },
        lualine_z = { "location" },
      },
    })
  end,
}
