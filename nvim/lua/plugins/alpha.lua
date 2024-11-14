return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    alpha.setup(dashboard.opts)
	end,
}