-- Paq frontend module.

-- Download and install Paq.
-- @returns table: require('paq-nvim').paq table
local function initial_backend()
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

    local paq = require('paq-nvim').paq
    paq{
        'savq/paq-nvim',
        opt=true
    }
    return paq
end


Paq = {
    _instance = nil,
    _paq = nil
}
Paq.__index = Paq

-- Create Paq instance as singleton.
-- @returns table: Paq table instance
function Paq:_new()
    if self._instance then
	return self._instance
    end

    local instance = { }
    setmetatable(instance, Paq)

    return instance
end

-- Initial Paq instance.
-- @returns nil
function Paq:_init()
    self._paq = initial_backend()
end

function Paq:create()
    local paq = self:_new()
    self:_init()

    return paq
end

-- Register package in Paq.
-- @param package table: table with package metadata
-- @returns nil
function Paq:register(package)
    local name   = package.name or nil
    local as	 = package.as or nil
    local branch = package.branch or nil
    local opt 	 = package.opt or false
    local run	 = package.run or nil
    local url	 = package.url or string.format('https://github.com/%s', name)

    self._paq{
	name,
	as=as,
	branch=branch,
	opt=opt,
	run=run,
	url=url
    }
end

-- Execute 'PaqInstall' command.
-- @returns nil
function Paq:install()
    vim.cmd("PaqInstall")
end

-- Execute 'PaqClean' command.
-- @returns nil
function Paq:clean()
    vim.cmd("PaqClean")
end


local module = { }

-- Install packages list.
-- @param packages table: packages table list
-- @returns nil
function module.install(packages)
    paq = Paq:create()

    for _,package in ipairs(packages) do
        for _,dependency in ipairs(package.meta.dependencies) do
            paq:register(dependency.meta)
        end
        paq:register(package.meta)
    end

    paq:install()
    for _,package in ipairs(packages) do
        package.init()
    end
end

-- Paq class.
module.Paq = Paq

return module

