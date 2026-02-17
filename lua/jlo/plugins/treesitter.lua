return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "json", "javascript", "typescript", "tsx", "c_sharp",
      "yaml", "html", "css", "markdown", "markdown_inline",
      "bash", "lua", "vim", "dockerfile", "gitignore", "python", "go",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang and pcall(vim.treesitter.start, args.buf, lang) then
          -- started successfully
        end
      end,
    })
  end,
}
