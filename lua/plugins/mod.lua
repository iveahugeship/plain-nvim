-- Plugin module example.
-- Use this interface and require the module for include plugin.

local mod = { }

mod.meta = {
    name = 'nvim-telescope/telescope.nvim',
    source = 'https://github.com/nvim-telescope/telescope.nvim',
    description = '',
    dependencies = {}
}

mod.init = function()
end

return mod

