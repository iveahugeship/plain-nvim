-- Nvim-Bufferline: a snazzy buffer line (with minimal tab integration) for Neovim built using lua.
-- More: https://github.com/akinsho/nvim-bufferline.lua

local function config()
    require('bufferline').setup {
        options = {
            numbers = "ordinal",
            number_style = "superscript",
            mappings = false,

            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',

            max_name_length = 18,
            max_prefix_length = 15, -- Prefix used when a buffer is de-duplicated.
            tab_size = 18,

            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            persist_buffer_sort = true,
            separator_style = "thin",
            enforce_regular_tabs = true,
            always_show_bufferline = true,

            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict)
                return "("..count..")"
            end,

            offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
        }
    }

    -- Key map.
    --vim.api.nvim_del_keymap(
    --    'n',
    --    '<ESC>'
    --)

end

local meta = {
    "akinsho/nvim-bufferline.lua",
    config = config(),
    requires = require("plugins.nvim-web-devicons")
}

return meta

