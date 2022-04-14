local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("null-ls not found")
  return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    ---- Formatting ----
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- python
		-- formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.gofmt,

    ---- Diagnostics ----
    -- diagnostics.codespell.with({ filetypes = { } }),

    ---- Code Actions ----
    -- code_actions.gitsigns,
    -- code_actions.eslint,
    -- code_actions.refactoring,
  },
  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  -- diagnostics_format = "[#{s}] #{m}",
})
