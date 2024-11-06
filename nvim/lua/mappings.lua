require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Disable mappings
local nomap = vim.keymap.del

nomap("i", "<C-k>")
nomap("n", "<C-k>")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- -- nvimtree
map("n", "<F8>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
nomap("n", "<C-n>")


-- tabufline
map("n", "<C-n>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<C-p>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })


-- tmux navigator keymap 
nomap('n', '<C-j>') -- resolve slow delay (~2000ms)
map('n', '<C-h>', '<CMD>NavigatorLeft<CR>')
map('n', '<C-l>', '<CMD>NavigatorRight<CR>')
map('n', '<C-k>', '<CMD>NavigatorUp<CR>')
map('n', '<C-j>', '<CMD>NavigatorDown<CR>')


-- go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
