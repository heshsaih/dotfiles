return {
--	"rose-pine/neovim",
--	name = "rose-pine",
--	opts = {
--		variant = "moon",
--		styles = {
--			bold = true,
--			italic = true,
--			transparency = true,
--		},
--	},
--	config = function(module, opts)
--		require("rose-pine").setup(opts)
--		vim.cmd.colorscheme("rose-pine")
--	end,
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  opts = {
    transparent_mode = true,

  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.cmd.colorscheme("gruvbox")
  end
}
