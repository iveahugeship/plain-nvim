-- Plugin manager wrapper.

do -- Install Paq if it hasn't installed.

    -- Paq is a minimalistic plugin manager for NeoVim written on Lua.
    -- More: https://github.com/savq/paq-nvim
    local install_path = string.format('%s/site/pack/paqs/opt/paq-nvim', vim.fn.stdpath('data'))
    local source_path = 'https://github.com/savq/paq-nvim'
    
    local hasnt_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
    if hasnt_installed then
        vim.api.nvim_command('echo "Plugin manager hasn\'t found. Installing..."')
        vim.api.nvim_command(string.format('!git clone %s %s', source_path, install_path))
        vim.api.nvim_command('echo "Plugin manager has installed!"')
    end

    vim.api.nvim_command('packadd paq-nvim') -- Load package to NeoVim.
end


local utils = { }

utils.add = function(name)
    local paq = require('paq-nvim').paq
    paq{
        name,
        run='luafile(string.format("%s/init.lua", vim.fn.stdpath("config")))'
    }     
end

return utils

