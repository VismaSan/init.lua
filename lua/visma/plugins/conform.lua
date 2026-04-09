return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                cs  = { "csharpier" },
                -- xmllint formats .csproj / .props / .targets
                -- Requires: sudo apt install libxml2-utils  (Ubuntu/WSL)
                xml = { "xmllint" },
            },
            format_on_save = { timeout_ms = 2000, lsp_fallback = true },
        },
    },
}
