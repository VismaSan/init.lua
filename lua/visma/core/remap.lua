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
keymap.set("n", "x", '"_x') -- deletes one key (without copying it)
keymap.set("n", "<leader>+", "<C-a>") -- increase number
keymap.set("n", "<leader>-", "<C-x>") -- descrease number

-- split
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- tabs
keymap.set("n", "<leader>To", ":tabnew<CR>") -- new tab
keymap.set("n", "<leader>Tx", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>Tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>Tp", ":tabp<CR>") -- previous tab

-- INSERT mode
keymap.set("i", "jk", "<ESC>")
