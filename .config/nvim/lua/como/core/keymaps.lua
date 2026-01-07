vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>", {desc = "Exit insert mode"})

keymap.set("n", "<leader>pv", ":Explore<CR>", {desc = "Bring up the [P]roject [V]iew"})
keymap.set("n", "<leader>ch", ":nohl<CR>", {desc = "[C]lear search [H]ighlights"})
keymap.set("n", "<leader>pv", ":Explore<CR>", {desc = "Bring up the [P]roject [V]iew"})
keymap.set("n", "<leader>pv", ":Explore<CR>", {desc = "Bring up the [P]roject [V]iew"})
keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to previous [D]iagnostic message"})
keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to next [D]iagnostic message"})
keymap.set("n", "<leader>e", vim.diagnostic.open_float, {desc = "Show diagnostic [E]rror message"})
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "Open diagnostic [Q]uickfix"})
