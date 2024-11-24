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
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "csharp_ls", "eslint", "dockerls", "jsonls" }
            })
        end
    },
    {
        -- Communication from nvim to LSP: setup all languages separately
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            local language_servers = { 'lua_ls', 'csharp_ls', 'eslint', 'dockerls', 'jsonls' }

            for _, lsp in ipairs(language_servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities
                }
            end

            -- :h vim.lsp.buf -> command to show all available lsp actions
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})

            --vim.keymap.set('n', 'D', vim.lsp.buf.type_definition, {}) -> open in floating view not new buf
            -- vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {})
            -- references({context}, {options})
            -- type_definition({options})
        end
    }
}
