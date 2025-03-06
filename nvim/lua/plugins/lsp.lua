return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {},
    config = function(_, opts)
      require("mason").setup(opts)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "gopls", "pyright", "svelte", "tailwindcss" },
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities
      })
      lspconfig.svelte.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
--  {
--    "rachartier/tiny-inline-diagnostic.nvim",
--    event = "VeryLazy", -- Or `LspAttach`
--    priority = 1000,  -- needs to be loaded in first
--    config = function(_, opts)
--      vim.diagnostic.config({ virtual_text = false })
--      require("tiny-inline-diagnostic").setup(opts)
--    end,
--  },
}
