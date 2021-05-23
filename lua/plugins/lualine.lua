local function config()
    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'material',
            component_separators = {'', ''},
            section_separators = {'', ''},
            disabled_filetypes = {}
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {},
        tabline = {},
        extensions = {}
    }
end

local meta = {
    "hoob3rt/lualine.nvim",
    config = config(),
    requires = require("plugins.nvim-web-devicons")
}

return meta

