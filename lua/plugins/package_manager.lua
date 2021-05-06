-- Plugin manager frontend.

local _packages_list = { }

local function _add_package(args)
    local name   = args[1].meta.name
    local as	 = args.as or nil
    local branch = args.branch or nil
    local opt 	 = args.opt or false
    local run	 = args.run or nil
    local url	 = args.url or string.format('https://github.com/%s', name)

    local paq = require('paq-nvim').paq
    paq{
	name,
	as=as,
	branch=branch,
	opt=opt,
	run=run,
	url=url
    }

    table.insert(_packages_list, args[1])
end

local function _install_packages()
    vim.cmd('PaqInstall')
end

local function _initial_packages()
    for _,package in ipairs(_packages_list) do
	package.init()
    end
end

local function _initial_backend()
    local source_path = 'https://github.com/savq/paq-nvim'
    local install_path = string.format('%s/site/pack/paqs/opt/paq-nvim', vim.fn.stdpath('data'))
    
    local hasnt_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
    if hasnt_installed then
        vim.cmd('echo "Plugin manager hasn\'t found. Installing..."')
        vim.cmd(string.format('!git clone %s %s', source_path, install_path))
        vim.cmd('echo "Plugin manager has installed!"')
    end

    -- Load package to NeoVim.
    vim.cmd('packadd paq-nvim') 
    require('paq-nvim').paq{
        'savq/paq-nvim',
        opt=true
    }
end


local package_manager = { }

-- Install package.
function package_manager._install(package)
    for _,dependency in ipairs(package.meta.dependencies) do
	_add_package{dependency}
    end
    _add_package{package}

    _install_packages()
    _initial_packages()
end

-- Install packages list.
function package_manager.install(packages_list)
    _initial_backend()

    for _,package in ipairs(packages_list) do
	package_manager._install(package)
    end
end

return package_manager

