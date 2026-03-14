vim.g.mapleader = " "

-- Add this to your init.lua
vim.keymap.set('n', '<Leader>e', ':Ex<CR>', { noremap = true, silent = true, desc = 'Open Netrw' })
require("config.options")
require("config.lazy")

