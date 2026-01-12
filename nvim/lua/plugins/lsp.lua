return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {},
		config = function(_, opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup({})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.diagnostic.config({ virtual_text = true })
		end,
	},
	--  {
	--    "rachartier/tiny-inline-diagnostic.nvim",
	--    event = "VeryLazy", -- Or `LspAttach`
	--    priority = 1000,  -- needs to be loaded in first
	--    config = function(_, opts)
	--      vim.diagnostic.config({ virtual_text = false })
	--      require("tiny-inline-diagnostic").setup(opts)
	--    end,
	--  },
}
