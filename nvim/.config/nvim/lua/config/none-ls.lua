local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    null_ls.builtins.formatting.clang_format, -- Formatting
    -- null_ls.builtins.diagnostics.cppcheck, -- Diagnostics
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.diagnostics.deno_lint,
    -- Add any other linters or diagnostics tools you prefer
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
