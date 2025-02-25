return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()
		local builtin = require("telescope.builtin")

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<C-y>", builtin.find_files, {})
		keymap.set("n", "<C-f>", builtin.git_files, {})
		keymap.set("n", "<C-g>", builtin.live_grep, {})
		keymap.set("n", "<C-p>", builtin.oldfiles, {})
	end,
}
