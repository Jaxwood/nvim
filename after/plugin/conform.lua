vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ lsp_fallback = true })
end)

