-- .NET build / run keymaps — only active in C# buffers
-- Requires: voldikss/vim-floaterm (loaded at startup via floaterm.lua)

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "cs" },
    callback = function()
        local opts = { buffer = true, silent = true }

        vim.keymap.set("n", "<leader>db", function()
            vim.cmd("FloatermNew dotnet build")
        end, vim.tbl_extend("force", opts, { desc = "dotnet build" }))

        vim.keymap.set("n", "<leader>dr", function()
            vim.cmd("FloatermNew dotnet run")
        end, vim.tbl_extend("force", opts, { desc = "dotnet run" }))

        vim.keymap.set("n", "<leader>dp", function()
            vim.cmd("FloatermNew dotnet publish -c Release")
        end, vim.tbl_extend("force", opts, { desc = "dotnet publish (Release)" }))

        vim.keymap.set("n", "<leader>dc", function()
            vim.cmd("FloatermNew dotnet clean")
        end, vim.tbl_extend("force", opts, { desc = "dotnet clean" }))
    end,
})

return {}
