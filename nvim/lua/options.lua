require "nvchad.options"

vim.opt.whichwrap:remove { "<", ">" }
vim.opt.colorcolumn = { "100", "120" }
vim.opt.fileformats = { "unix" }
vim.opt.bomb = false

vim.diagnostic.config { virtual_text = true, severity_sort = true }
