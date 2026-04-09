return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "williamboman/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = { "netcoredbg" },
                automatic_setup = true,
            })

            local dap = require("dap")

            dap.adapters.coreclr = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
                args = { "--interpreter=vscode" },
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "Launch - netcoredbg",
                    request = "launch",
                    program = function()
                        -- Default points at the .NET 10 TFM output folder.
                        -- Adjust "net10.0" if targeting a different framework.
                        local default = vim.fn.getcwd()
                            .. "/bin/Debug/net10.0/"
                            .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                            .. ".dll"
                        return vim.fn.input("Path to dll: ", default, "file")
                    end,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "coreclr",
                    name = "Attach - netcoredbg",
                    request = "attach",
                    processId = require("dap.utils").pick_process,
                },
            }

            -- Useful keymaps
            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            vim.keymap.set("n", "<F12>", dap.step_out)
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>B", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end)
        end,
    },
}
