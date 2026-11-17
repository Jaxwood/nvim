return {
	"esmuellert/codediff.nvim",
	cmd = "CodeDiff",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		keymaps = {
			view = {
				toggle_layout = "<leader>dv",
			},
		},
	},
}
