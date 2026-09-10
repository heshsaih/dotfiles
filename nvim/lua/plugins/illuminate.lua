return {
	"RRethy/vim-illuminate",
	opts = {
		providers = {
			"treesitter",
			"regex",
		},
        delay = 0
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
