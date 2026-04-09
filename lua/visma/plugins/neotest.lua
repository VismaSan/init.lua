return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "Issafalcon/neotest-dotnet",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")({
                        dap = { justMyCode = false },
                    }),
                },
            })

            local neotest = require("neotest")
            -- Run nearest test
            vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end,
                { desc = "Run nearest test" })
            -- Run all tests in current file
            vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end,
                { desc = "Run file tests" })
            -- Debug nearest test (uses DAP)
            vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end,
                { desc = "Debug nearest test" })
            -- Stop running test
            vim.keymap.set("n", "<leader>tS", function() neotest.run.stop() end,
                { desc = "Stop test" })
            -- Toggle summary panel
            vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end,
                { desc = "Toggle test summary" })
            -- Open test output
            vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end,
                { desc = "Open test output" })
            -- Toggle output panel
            vim.keymap.set("n", "<leader>tO", function() neotest.output_panel.toggle() end,
                { desc = "Toggle output panel" })
        end,
    },
}
