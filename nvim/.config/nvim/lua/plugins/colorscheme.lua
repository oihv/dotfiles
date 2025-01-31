return {
    "AlphaTechnolog/pywal.nvim",
    lazy = false, -- Load immediately on startup
    priority = 1000, -- Ensure it loads before other colorscheme plugins
    config = function()
        -- Set up pywal and load the colors
        require("pywal").setup()
        vim.cmd("colorscheme pywal")
    end,
}
-- lua/plugins/rose-pine.lua
-- return { 
-- 	"rose-pine/neovim", 
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }
