vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.cpp",
  command = "set makeprg=g++\\ -g\\ %\\ -o\\ %<",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.c",
  command = "set makeprg=gcc\\ -g\\ %\\ -o\\ %<",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  command = "set makeprg=python\\ %",
})

local function compile_and_run()
  vim.cmd("make") -- Compile using 'makeprg'

  local filetype = vim.bo.filetype
  local output = vim.fn.expand("%:r") -- Get filename without extension

  vim.cmd("!" .. output)
end

local function compile_only()
  vim.cmd("make") -- Just compile
end

vim.api.nvim_create_user_command("CompileRun", compile_and_run, {})
vim.api.nvim_create_user_command("CompileOnly", compile_only, {})
