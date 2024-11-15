return { 
  'rose-pine/neovim', 
  name = 'rose-pine',
  opts = {
    variant = "moon",
    styles = {
      bold = true,
      italic = true,
      transparency = true
    }
  },
  config = function(module, opts)
    require('rose-pine').setup(opts) 
    vim.cmd.colorscheme 'rose-pine'
  end
}
