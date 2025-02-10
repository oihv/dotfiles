local M = {}

function M.setup()
  local harpoon = require("harpoon")

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  -- Key mappings for Harpoon
  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
  end)
  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  -- Navigate to specific marks in Harpoon list
  vim.keymap.set("n", "<A-h>", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "<A-j>", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "<A-k>", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "<A-l>", function()
    harpoon:list():select(4)
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<C-S-P>", function()
    harpoon:list():prev()
  end)
  vim.keymap.set("n", "<C-S-N>", function()
    harpoon:list():next()
  end)
end

return M
