-- Основные опции
vim.opt.number = true          -- номера строк
vim.opt.relativenumber = true  -- относительные номера
vim.opt.tabstop = 4            -- размер табуляции
vim.opt.shiftwidth = 4
vim.opt.expandtab = true       -- пробелы вместо табов
vim.opt.smartindent = true
vim.opt.wrap = false           -- отключить перенос строк
vim.opt.termguicolors = true   -- truecolor
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Клавиши-лидеры
vim.g.mapleader = " "          -- пробел как лидер
vim.g.maplocalleader = " "
require("config.lazy")

vim.api.nvim_set_keymap('i', '<C-w>', '<C-o>ciw', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-u>', '<C-o>u', { noremap = true })
vim.keymap.set('i', '<C-Left>', '<C-o>b')
vim.keymap.set('i', '<C-Right>', '<C-o>w')
vim.api.nvim_set_keymap('v', 'y', 'myy`y', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')
