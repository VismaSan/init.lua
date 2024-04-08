return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "lua", "c_sharp" },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        }
    end
}
