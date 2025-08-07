local M = {}

function M.setup()
  local harpoon = require("harpoon")

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  -- Key mappings for Harpoon
  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
  end, { desc = "Add file to harpoon list" })
  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, { desc = "Open harpoon menu" })

  -- Navigate to specific marks in Harpoon list
  vim.keymap.set("n", "<A-n>", function()
    harpoon:list():select(1)
  end, { desc = "Harpoon navigate to list 1" })
  vim.keymap.set("n", "<A-e>", function()
    harpoon:list():select(2)
  end, { desc = "Harpoon navigate to list 2" })
  vim.keymap.set("n", "<A-i>", function()
    harpoon:list():select(3)
  end, { desc = "Harpoon navigate to list 3" })
  vim.keymap.set("n", "<A-o>", function()
    harpoon:list():select(4)
  end, { desc = "Harpoon navigate to list 4" })

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<A-S-P>", function()
    harpoon:list():prev()
  end, { desc = "Harpoon move to prev list" })
  vim.keymap.set("n", "<A-S-N>", function()
    harpoon:list():next()
  end, { desc = "Harpoon move to next list" })
end

return M
