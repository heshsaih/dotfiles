return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = { "lua", "javascript" },
      highlight = { enable = true },
      indent = { enable = false },
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
