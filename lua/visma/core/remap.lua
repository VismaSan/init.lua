local keymap = vim.keymap

-- NORMAL mode
keymap.set("n", "<leader>x", "<ESC>")
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>Q", ":bd<CR>")
keymap.set("n", "<localleader>h", "<C-w>h", { desc = "Window left" })
keymap.set("n", "<localleader>l", "<C-w>l", { desc = "Window right" })
keymap.set("n", "<localleader>j", "<C-w>j", { desc = "Window down" })
keymap.set("n", "<localleader>k", "<C-w>k", { desc = "Window up" })

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
keymap.set("n", "x", '"_x')                -- deletes one key (without copying it)
keymap.set("n", "<leader>+", "<C-a>")      -- increase number
keymap.set("n", "<leader>-", "<C-x>")      -- descrease number
keymap.set("n", "<leader>z", "za")         -- toggle fold
keymap.set("n", "<leader>m", "zM")         -- close all
keymap.set("n", "<leader>r", "zR")         -- open all

-- split
keymap.set("n", "<leader>sv", "<C-w>v")     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- tabs
keymap.set("n", "<leader>To", ":tabnew<CR>")   -- new tab
keymap.set("n", "<leader>Tx", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>Tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>Tp", ":tabp<CR>")     -- previous tab

-- VISUAL mode
keymap.set('v', '<C-c>', '"+y', { desc = 'Copy to system clipboard' })
keymap.set('v', '<C-v>', '"+p', { desc = 'Paster from system clipboard' })
keymap.set('v', '<C-v>', '<C-r>+', { desc = 'Paster from system clipboard' })

-- INSERT mode
keymap.set("i", "jk", "<ESC>")

-- TERMINAL mode
keymap.set("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", { silent = true })
keymap.set("t", "<leader>tn", "<C-\\><C-n>:FloatermNext<CR>", { silent = true })
keymap.set("t", "<leader>tp", "<C-\\><C-n>:FloatermPrev<CR>", { silent = true })
