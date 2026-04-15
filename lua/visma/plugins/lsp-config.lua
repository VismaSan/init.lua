return {
    {
        -- LSP manager
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end
    },
    {
        -- LSP config: installing language servers on machine
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "omnisharp", "eslint", "dockerls", "jsonls", "ts_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('*', {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })

            vim.lsp.config('omnisharp', {
                enable_roslyn_analyzers = true,
                enable_import_completion = true,
                enable_editorconfig_support = true,
                organize_imports_on_format = false,
            })

            local language_servers = { 'lua_ls', 'omnisharp', 'eslint', 'dockerls', 'jsonls', 'ts_ls' }
            vim.lsp.enable(language_servers)

            -- Enable inlay hints for all LSP clients (no-op if server doesn't support it)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                end,
            })

            vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = 'LSP references' })
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>cf', function()
                require("conform").format({ bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 10000 })
            end, { desc = 'Format file' })
        end
    },
}
