return {
    "sainnhe/everforest",
    priority = 1000,
    lazy = false,
    config = function()
        vim.o.background = "dark" -- "dark | light"
        vim.opt.termguicolors = true
        vim.g.everforest_background = "medium" -- "soft | medium | hard"
        vim.g.everforest_ui_contrast = "high" -- "high | low"
        vim.g.everforest_enable_italic = 1
        vim.g.everforest_transparent_background = 1
        vim.g.everforest_show_eob = 0

        vim.cmd("colorscheme everforest")
    end
}
