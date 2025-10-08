return {
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		variant = "moon",
		styles = {
			bold = true,
			italic = true,
			transparency = true,
		},
	},
	config = function(module, opts)
		require("rose-pine").setup(opts)
		vim.cmd.colorscheme("rose-pine")
	end,
	--    "catppuccin/nvim",
	--    name = "catppuccin",
	--    priority = 1000,
	--    opts = {
	--        flavour = "macchiato",
	--        transparent_background = true,
	--    },
	--    config = function(_, opts)
	--        require("catppuccin").setup(opts)
	--        vim.cmd.colorscheme("catppuccin")
	--    end,
	--	  "ellisonleao/gruvbox.nvim",
	--	  opts = {
	--	    transparent_mode = true,
	--	    bold = true,
	--	  },
	--	  config = function(_, opts)
	--	    require("gruvbox").setup(opts)
	--	    vim.cmd.colorscheme("gruvbox")
	--	  end,
	--  {
	--    "vague2k/vague.nvim",
	--    opts = {
	--      transparent = true,
	--      style = {
	--        strings = "bold",
	--        keywords = "bold"
	--      }
	--    },
	--    config = function(_, opts)
	--      require("vague").setup(opts)
	--      vim.cmd.colorscheme("vague")
	--    end
	--  }
}
