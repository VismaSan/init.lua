return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                cs  = { "csharpier" },
                -- xmllint formats .csproj / .props / .targets
                -- Requires: sudo apt install libxml2-utils
                xml = { "xmllint" },
            },
            formatters = {
                -- Override the built-in csharpier to always pass --stdin-path.
                -- The built-in omits it for global installs, causing a hang.
                csharpier = {
                    command = "csharpier",
                    args = { "format", "--stdin-path", "$FILENAME" },
                    stdin = true,
                },
            },
        },
    },
}
