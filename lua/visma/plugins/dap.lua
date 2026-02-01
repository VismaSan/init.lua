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
                        -- points at your compiled dll (Debug)

                        return vim.fn.input(
                            "Path to dll: ",
                            vim.fn.getcwd() .. "/bin/Debug/",
                            "file"
                        )
                    end,
                    cwd = vim.fn.getcwd(),
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
