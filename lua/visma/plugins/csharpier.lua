return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                cs = { "csharpier" },
            },
            format_on_save = { timeout_ms = 2000, lsp_fallback = true },
        },
    },
}
