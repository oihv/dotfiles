local M = {}

M.setup = function()
  local lsp = require("lsp-zero")
  lsp.preset("lsp-compe")

  lsp.setup()

  vim.opt.completeopt = { "menu", "menuone", "noselect" }

  local cmp = require("cmp")
  local cmp_config = lsp.defaults.cmp_config({
    window = {
      completion = cmp.config.window.bordered(),
    },
  })

  cmp.setup(cmp_config)
end

return M
