-- .NET build / run keymaps — only active in C# buffers
-- Requires: voldikss/vim-floaterm (already in your config)

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs" },
    callback = function()
        local buf = { buffer = true, silent = true }

        vim.keymap.set("n", "<leader>db",
            "<cmd>FloatermNew --title=build dotnet build<CR>",
            vim.tbl_extend("force", buf, { desc = "dotnet build" }))

        vim.keymap.set("n", "<leader>dr",
            "<cmd>FloatermNew --title=run dotnet run<CR>",
            vim.tbl_extend("force", buf, { desc = "dotnet run" }))

        vim.keymap.set("n", "<leader>dp",
            "<cmd>FloatermNew --title=publish dotnet publish -c Release<CR>",
            vim.tbl_extend("force", buf, { desc = "dotnet publish (Release)" }))

        vim.keymap.set("n", "<leader>dc",
            "<cmd>FloatermNew --title=clean dotnet clean<CR>",
            vim.tbl_extend("force", buf, { desc = "dotnet clean" }))
    end,
})

-- No plugin to install; this file just registers autocmds via lazy's module loading
return {}
