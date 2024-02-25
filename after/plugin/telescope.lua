require('telescope').setup({
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return {
                    "--hidden",
                    "--glob", "!**/.git/*",
                    "--glob", "!**/.cache/*",
                    "--glob", "!**/yarn.lock"
                }
            end
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-y>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-p>', builtin.oldfiles, {})
