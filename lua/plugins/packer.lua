-- Packer wrapper.

-- Configuration for Packer instance.
-- @return table: packer configuration table.
local function get_config()
    -- More: https://github.com/wbthomason/packer.nvim#custom-initialization
    local config = {
    }

    return config
end

-- Download and install Packer.
-- @return table: packer module table. 
local function get_packer()
    local source_path = 'https://github.com/wbthomason/packer.nvim'
    local install_path = string.format('%s/site/pack/packer/start/packer.nvim', vim.fn.stdpath('data'))

    local hasnt_installed = vim.fn.empty(vim.fn.glob(install_path)) > 0
    if hasnt_installed then
        vim.cmd('echo "Packer hasn\'t found. Installing..."')
        vim.cmd(string.format('!git clone %s %s', source_path, install_path))
        vim.cmd('echo "Packer has installed!"')
    end

    vim.cmd('packadd packer.nvim')

    return require('packer')
end

-- Initialize Packer.
-- @return table: packer module table.
local function init_packer()
    local packer = nil
    if packer then
        return packer
    end

    local packer = get_packer()
    local config = get_config()

    packer.init(config)
    packer.reset() -- Recommended if specification code is re-running.

    -- Packer has to manage itselft or it is trying delete leave :)
    packer.use {
	'wbthomason/packer.nvim'
    }

    return packer
end

return init_packer()

