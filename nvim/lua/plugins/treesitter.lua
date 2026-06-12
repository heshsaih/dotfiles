return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = false },
		},
		config = function(_, opts)
			local languages = { "python", "rust", "c", "cpp" }

			require("nvim-treesitter").install(languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function()
					vim.treesitter.start()
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(ev.match)
					local available_langs = require("nvim-treesitter").get_available()
					local is_available = vim.tbl_contains(available_langs, lang)
					if is_available then
						local installed_langs = require("nvim-treesitter").get_installed()
						local installed = vim.tbl_contains(installed_langs, lang)
						if not installed then
							require("nvim-treesitter").install(lang):wait()
						end
						vim.treesitter.start()
						require("nvim-treesitter").indentexpr()
					end
				end,
			})
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
