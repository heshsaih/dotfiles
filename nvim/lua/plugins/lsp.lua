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
      local languages = {
        "tailwindcss",
        "lua_ls",
        "ts_ls",
        "gopls",
        "pylsp",
        "svelte",
        "powershell_es",
        "clangd",
        "glsl_analyzer",
        "jdtls",
        "rust_analyzer",
        "html"
      }
      require("mason-lspconfig").setup({
        ensure_installed = languages,
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set({"n", "v"}, "<leader>cr", vim.lsp.buf.rename, {})
      vim.diagnostic.config({ virtual_text = true })
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
