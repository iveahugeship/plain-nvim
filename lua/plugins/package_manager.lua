-- Plugin manager wrapper.

local function _install_package_manager()
    -- Paq is a minimalistic plugin manager for NeoVim written on Lua.
    -- More: https://github.com/savq/paq-nvim
    local source_path = 'https://github.com/savq/paq-nvim'
    local install_path = string.format('%s/site/pack/paqs/opt/paq-nvim', vim.fn.stdpath('data'))
    
    local hasnt_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
    if hasnt_installed then
        vim.cmd('echo "Plugin manager hasn\'t found. Installing..."')
        vim.cmd(string.format('!git clone %s %s', source_path, install_path))
        vim.cmd('echo "Plugin manager has installed!"')
    end

    vim.cmd('packadd paq-nvim') -- Load package to NeoVim.
end

local function _install_package(name)
    local paq = require('paq-nvim').paq
    paq{
        name
    }     
end

local function _init_package(init_fn)
    init_fn()
end

local package_manager = { }

package_manager.install = function(package_list)
    _install_package_manager()

    for _,package in ipairs(package_list) do
	_install_package(package.meta.name)
	_init_package(package.init)
    end
end

return package_manager

