-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
---------------------

-- vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "<leader>ua", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" })
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("i", "jk", "<ESC>")
-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

vim.keymap.set("n", "<C-o>", "<cmd>:BufferLineCycleNext<cr>")
vim.keymap.set("n", "<C-i>", "<cmd>:BufferLineCyclePrev<cr>")

vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>") -- make the window biger vertically
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>") -- make the window smaller vertically
vim.keymap.set("n", "<C-Up>", "<cmd>horizontal resize +2<cr>") -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "<C-Down>", "<cmd>horizontal resize -2<cr>") --
--tmux
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
