return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.keymap.set("n", "<localleader>t", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<localleader>f", ":NvimTreeFocus<CR>")

    require("nvim-tree").setup {
        view = {
            adaptive_size = true
        }
    }
    require("nvim-web-devicons").setup {
        default = true
    }
  end
}
