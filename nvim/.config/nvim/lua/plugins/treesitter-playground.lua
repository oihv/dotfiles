return {
    'nvim-treesitter/playground',
    config = function()
        require ("nvim-treesitter.configs").setup {
            playground = {
                enable = true,
            },
        }
    end,
}
