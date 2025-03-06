return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      }
    },
    window = {
      position = "right"
    }
  },
  config = function(_, opts)
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle right<CR>')
    require("neo-tree").setup(opts)
  end
}
