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
                ensure_installed = { "lua_ls", "omnisharp", "eslint", "dockerls", "jsonls", "ts_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            vim.lsp.config('*', {
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
            })
            local language_servers = { 'lua_ls', 'omnisharp', 'eslint', 'dockerls', 'jsonls', 'ts_ls' }
           vim.lsp.enable(language_servers)

           vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
           vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
           vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
           vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
           vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
-- -- lua/plugins/csharp.lua (example)
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--     },
--     config = function()
--       require("mason").setup()
--       require("mason-lspconfig").setup({
--         ensure_installed = { "omnisharp" },
--       })

--       local lspconfig = require("lspconfig")
--       lspconfig.omnisharp.setup({
--         -- If you use cmp, you may want capabilities here
--         -- capabilities = require("cmp_nvim_lsp").default_capabilities(),
--       })
--     end,
--   },
-- }
}
