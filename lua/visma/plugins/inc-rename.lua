return {
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()

            vim.keymap.set("n", "<leader>rn", function()
                return ":IncRename " .. vim.fn.expand("<cword>") .. "<C-u>:IncRename "
            end, { expr = true })
        end
    }
}
