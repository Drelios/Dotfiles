return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format ,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.styler,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.isort,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
