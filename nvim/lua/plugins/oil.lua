return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
	},
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	lazy = false,
	config = function(_, opts)
		local oil = require("oil")
		oil.setup(opts)
		vim.keymap.set("n", "<leader>pv", oil.open)
	end,
}
