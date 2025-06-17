return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "python", "c", "r", "latex", "php", "sql", "html", "css" },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    })
  end,
}
