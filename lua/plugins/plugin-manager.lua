-- Plugin manager wrapper.

-- Install Paq if it hasn't installed.
-- More: https://github.com/savq/paq-nvim
local install_path = vim.fn.stdpath('data') .. '/site/pack/paqs/opt/paq-nvim'
local source_path = 'https://github.com/savq/paq-nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('echo "Plugin manager hasn\'t found. Installing..."')
  vim.api.nvim_command('!git clone ' .. source_path .. ' ' .. install_path)
  vim.api.nvim_command('echo "Plugin manager has installed."')
end

vim.cmd 'packadd paq-nvim' -- Load package to NeoVim.

-- Let Paq manage itself.
local paq = require('paq-nvim').paq
paq{'savq/paq-nvim'}  


local utils = { }

function utils.add_plugin(name)
  local paq = require('paq-nvim').paq
  paq{name}     
end

return utils

