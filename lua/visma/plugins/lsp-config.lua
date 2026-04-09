return {
    {
        -- LSP manager
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        -- LSP config: installing language servers on machine
        -- C# is handled by roslyn.nvim (see roslyn.lua), not listed here
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "eslint", "dockerls", "jsonls", "ts_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config('*', {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })

            local language_servers = { 'lua_ls', 'eslint', 'dockerls', 'jsonls', 'ts_ls' }
            vim.lsp.enable(language_servers)

            -- Enable inlay hints for every LSP that supports them
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client and client.supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                    end
                end,
            })

            vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
