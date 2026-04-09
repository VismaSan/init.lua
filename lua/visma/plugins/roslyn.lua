return {
    {
        "seblj/roslyn.nvim",
        ft = "cs",
        dependencies = {
            "williamboman/mason.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        -- Run `:MasonInstall roslyn` on first setup.
        -- The build hook below triggers it automatically after plugin install.
        build = function()
            vim.notify("roslyn.nvim: run :MasonInstall roslyn to install the language server", vim.log.levels.INFO)
        end,
        config = function()
            require("roslyn").setup({
                config = {
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = function(client, bufnr)
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end,
                },
            })
        end,
    },
}
