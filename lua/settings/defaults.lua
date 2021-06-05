-- Default Settings.

-- Interface.
vim.wo.number = true
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true

-- Cursor.
vim.o.mouse = "a"
vim.wo.cursorline = true 

-- Other.
vim.o.clipboard = "unnamedplus"
vim.o.fileencoding = "utf-8"

-- Filetype.
vim.cmd [[
  autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1

  syntax on
  filetype on
  filetype plugin on
  filetype indent on
]]

-- Indentation.
vim.cmd [[
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab

  set smarttab
  set autoindent
  set smartindent
]]

