return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"
    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.jq,
      null_ls.builtins.formatting.pyflyby,
      null_ls.builtins.formatting.black,
      -- diagnostics
      null_ls.builtins.diagnostics.mypy,
      -- Refactoring
      null_ls.builtins.code_actions.refactoring,
    }
    return config -- return final config table
  end,
}
