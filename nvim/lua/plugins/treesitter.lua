return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ensure_installed = { "lua" },
			highlight = { enable = true },
			indent = { enable = false },
			rainbow = { enable = true },
		},
		config = function(_, opts)
			local config = require("nvim-treesitter.configs")
			config.setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
}
