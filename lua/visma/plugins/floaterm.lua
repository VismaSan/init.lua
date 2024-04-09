return {
    'voldikss/vim-floaterm',
    keys = {
       { "<leader>to", "<cmd>FloatermNew<cr>", desc = "FloatermNew" },
       { "<leader>tt", "<cmd>FloatermToggle<cr>", desc = "FloatermToggle" },
       { "<leader>tn", "<cmd>FloatermNext<cr>", desc = "FloatermNext" }
       -- TODO: create mapping for exiting to normal mode
    }
}
