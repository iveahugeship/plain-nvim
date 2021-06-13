-- Default Settings.

-- Interface.
vim.wo.number = true
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = false

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
  setl tabstop=4
  setl softtabstop=4
  setl shiftwidth=4
  setl expandtab

  setl smarttab
  setl autoindent
  setl smartindent
]]

