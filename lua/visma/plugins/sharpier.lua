return {
    -- {
    --     "stevearc/conform.nvim",
    --     opts = {
    --         formatters_by_ft = {
    --             -- cs = { "csharpier" },
    --             cs = { "dotnet_format" },
    --         },
    --         format_on_save = { timeout_ms = 2000, lsp_fallback = true },
    --         formatters = {
    --             dotnet_format = {
    --                 command = "dotnet",
    --                 args = { "format", "--include", "$FILENAME" },
    --                 stdin = false,
    --             }
    --         }
    --     },
    --     build = function()
    --         local handle = io.popen("dotnet tool list -g")

    --         if not handle then
    --             vim.notify("Failed to check dotnet tools. Is dotnet installed?", vim.log.levels.WARN)
    --             return
    --         end

    --         local result = handle:read("*a")
    --         handle:close()

    --         if not result:match("dotnet%-format") then
    --             vim.notify("Installing dotnet-format...", vim.log.levels.INFO)
    --             vim.fn.system("dotnet tool install -g dotnet-format")
    --             vim.notify("dotnet-format installed!", vim.log.levels.INFO)
    --         end
    --     end
    -- },
}
