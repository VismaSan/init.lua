return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "sharkdp/fd"
    },
    config = function()
        local builtin = require('telescope.builtin')
        local action = require('telescope.actions')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fF', ':Telescope file_browser path=%:p:h<CR>', {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
}
