return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"lua"},
    highlight = { enable = true },
    indent = { enable = true }
  },
  config = function (_, opts)
    local config = require('nvim-treesitter.configs')
    config.setup(opts)
  end
}
