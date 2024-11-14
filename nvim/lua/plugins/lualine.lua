return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = "modus-vivendi"
  },
  config = function (_, opts)
    require("lualine").setup(opts)
  end
}
