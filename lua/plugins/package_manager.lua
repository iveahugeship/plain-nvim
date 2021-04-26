-- Plugin manager wrapper.

local _pkg_list = { }

local function _add_pkg(args)
    local name = args[1].meta.name
    local as = args.as or nil
    local branch = args.branch or nil
    local opt = args.opt or false
    local run = args.run or nil
    local url = args.url or string.format('https://github.com/%s', name)

    local paq = require('paq-nvim').paq
    paq{
	name,
	as=as,
	branch=branch,
	opt=opt,
	run=run,
	url=url
    }

    if not opt then
        table.insert(_pkg_list, args[1])
    end
end

local function _inst_pkg()
    vim.cmd('PaqInstall')
end

local function _init_pkg()
    for _,package in ipairs(_pkg_list) do
	package.init()
    end
end

local function _install_package_manager()
    local paq = {}
    paq.meta = {
        name = 'savq/paq-nvim',
        source = 'https://github.com/savq/paq-nvim',
        description = 'Paq is a minimalistic plugin manager for NeoVim written on Lua.',
        dependencies = {}
    }

    local install_path = string.format('%s/site/pack/paqs/opt/paq-nvim', vim.fn.stdpath('data'))
    
    local hasnt_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
    if hasnt_installed then
        vim.cmd('echo "Plugin manager hasn\'t found. Installing..."')
        vim.cmd(string.format('!git clone %s %s', paq.meta.source, install_path))
        vim.cmd('echo "Plugin manager has installed!"')
    end

    vim.cmd('packadd paq-nvim') -- Load package to NeoVim.
    _add_pkg{paq, opt=true}
end

local package_manager = { }

-- Install package.
-- @param package package_module: package module got with 'require'
-- @return nil
function package_manager.install(package)
    _install_package_manager()

    for _,pkg in ipairs(package.meta.dependencies) do
        _add_pkg{pkg}
    end
    _add_pkg{package}

    _inst_pkg()
    _init_pkg()
end

return package_manager

