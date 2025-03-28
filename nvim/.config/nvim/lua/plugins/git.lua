return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns preview_hunk" })
    vim.keymap.set(
      "n",
      "<leader>gt",
      ":Gitsigns toggle_current_line_blame<CR>",
      { desc = "Gitsigns toggle_current_line_blame" }
    )
  end,
}
