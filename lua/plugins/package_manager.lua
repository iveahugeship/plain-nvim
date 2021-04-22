-- Plugin manager wrapper.

local function _install_package(args)
    name = args[1]
    opt = args.opt or false

    local paq = require('paq-nvim').paq
    paq{
        name,
	opt=opt
    }     
end

local function _init_package(init_fn)
    init_fn()
end

local function _install_package_manager()
    -- Install Paq.
    -- Paq is a minimalistic plugin manager for NeoVim written on Lua.
    local paq = {}
    paq.name = 'savq/paq-nvim'
    paq.source = 'https://github.com/savq/paq-nvim'

    local install_path = string.format('%s/site/pack/paqs/opt/paq-nvim', vim.fn.stdpath('data'))
    
    local hasnt_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
    if hasnt_installed then
        vim.cmd('echo "Plugin manager hasn\'t found. Installing..."')
        vim.cmd(string.format('!git clone %s %s', paq.source, install_path))
        vim.cmd('echo "Plugin manager has installed!"')
    end

    vim.cmd('packadd paq-nvim') -- Load package to NeoVim.
    _install_package{paq.name, opt=true}
end

local package_manager = { }

-- Install packages.
-- @param package_list table: package modules
-- @return nil
function package_manager.install(packages_list)
    _install_package_manager()

    for _, package in ipairs(packages_list) do
	for _, dependency in ipairs(package.meta.dependencies) do
	    _install_package{dependency.meta.name}
	end

        _install_package{package.meta.name}
	_init_package(package.init)
    end
end

return package_manager

