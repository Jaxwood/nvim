-- map leader to space
vim.g.mapleader = " "

-- show neotree
vim.keymap.set("n", "<leader>n", ":Neotree reveal<CR>")

-- search for the word under the cursor
vim.keymap.set("n", "W", "*")

-- move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- replace the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
