vim.opt.tabstop = 2       -- Tab = 2 spaces
vim.opt.shiftwidth = 2   -- Auto-indent = 2 spaces
vim.opt.softtabstop = 2  -- Backspace respects 2 spaces
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.number = true         -- Show absolute line number for current line
vim.opt.relativenumber = true -- Show relative line numbers for other lines

-- Add this to your init.lua
vim.keymap.set('n', '<Leader>e', ':Ex<CR>', { noremap = true, silent = true, desc = 'Open Netrw' })


