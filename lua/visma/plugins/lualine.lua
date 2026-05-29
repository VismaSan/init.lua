return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local theme = require("lualine.themes.everforest")
        theme.normal.a.bg = "#89b4fa"
        require("lualine").setup({
            options = {
                theme = theme,
                globalstatus = true,
            },
        })
    end,
}
