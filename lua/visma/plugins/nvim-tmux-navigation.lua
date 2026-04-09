return {
    "christoomey/vim-tmux-navigator",
    cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
        "TmuxNavigatorProcessList",
    },
    keys = {
        { "M-h", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "M-j", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "M-k", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "M-l", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "M-/", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    }
}
