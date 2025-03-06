return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    theme = "gruvbox"
  },
  config = function (_, opts)
    require("lualine").setup(opts)
  end
}
