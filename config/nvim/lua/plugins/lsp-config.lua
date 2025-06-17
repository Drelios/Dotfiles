return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "cmake",
          "cssls",
          "ts_ls",
          "jsonls",
          "ltex",
          "grammarly",
          "pyre",
          "r_language_server",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.bashls.setup({})
      lspconfig.clangd.setup({})
      lspconfig.cmake.setup({})
      lspconfig.cssls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.ltex.setup({})
      lspconfig.grammarly.setup({})
      lspconfig.pyre.setup({})
      lspconfig.r_language_server.setup({})
      vim.keymap.set("n", "§", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>!", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<C-!>", vim.lsp.buf.definition, {})
    end,
  },
}
