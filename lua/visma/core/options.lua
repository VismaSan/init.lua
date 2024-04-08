local opt = vim.opt
local cmd = vim.cmd

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false
opt.cursorline = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus") -- force to use system clipboard

-- split windows
opt.splitright = true
opt.splitbelow = true

-- visual mode settings
-- opt.iskeyword:append("-")
