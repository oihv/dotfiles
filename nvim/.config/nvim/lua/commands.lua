-- Compile the current file using Makefile
function CompileAndRun()
  local filename = vim.fn.expand("%:r") -- Get the filename without extension
  vim.cmd("!make " .. filename)
end

vim.api.nvim_create_user_command("CompileRun", CompileAndRun, {})
