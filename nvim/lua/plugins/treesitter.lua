return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			highlight = { enable = true },
            ensure_installed = {"go"},
			indent = { enable = false },
		},
		config = function(_, opts)
			local config = require("nvim-treesitter.config")
			config.setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"nvim-treesitter/playground",
		cmd = { "TSPlaygroundToggle" },
	},
}
