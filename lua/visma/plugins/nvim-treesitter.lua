return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require('nvim-treesitter').setup {
            ensure_installed = { "lua", "c_sharp" },
            auto_install = true,
            highlight = {
                enable = true,
                -- additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            }
        }
    end
}
