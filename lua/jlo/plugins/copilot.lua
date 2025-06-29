return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true

    vim.keymap.set("i", "<C-j>", 'copilot#Accept("")', { silent = true, expr = true, replace_keycodes = false })
    vim.keymap.set({"n", "v" }, "<leader>t", "<cmd>CodeCompanionChat<cr>")
  end,
}
