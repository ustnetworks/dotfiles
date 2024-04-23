local keymap = vim.keymap
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk
keymap.set("n", "<leader>wq", ":wq<CR>") -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>") -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>") -- save

-- move current line / block with Alt-j/k similar to vscode.
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move current line/block down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move current line/block up" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move current line/block down" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move current line/block up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move current line/block down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move current line/block down" })

--Buffer related
vim.keymap.set("n", "<leader>n", ":bn<cr>", { desc = "Go to next buffer in buffer list" })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { desc = "Go to next buffer in buffer list" })
vim.keymap.set("n", "<leader>x", ":bd<cr>", { desc = "Unload buffer and delete buffer" })

--neo-tree
keymap.set({ "i", "n", "v" }, "<C-n>", "<cmd>Neotree toggle<CR>") -- toogle neo-tree

-- Terminal related
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("n", "<leader>tv", "<cmd>vsplit | term<cr>", { desc = "TERM: Launch terminal with vertical split" })
keymap.set("n", "<leader>th", "<cmd>split | term<cr>", { desc = "TERM: Launch terminal with horizontal split" })
