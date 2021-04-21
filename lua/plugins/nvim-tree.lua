local mod = { }

mod.meta = {
    name = 'kyazdani42/nvim-tree.lua',
    source = 'https://github.com/kyazdani42/nvim-tree.lua',
    description = '',
    dependencies = {}
}

mod.init = function()
    local tree = require('nvim-tree.config').nvim_tree_callback

    vim.g.nvim_tree_bindings = {
        ["cp"]		= tree("copy")
    }
end

return mod

