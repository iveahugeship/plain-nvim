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

            custom_filter = function(buf_number)
                -- Filter out filetypes you don't want to see.
                if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                    return true
                end
                -- Filter out by buffer name.
                if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                    return true
                end
                -- Filter out based on arbitrary rules.
                -- e.g. filter out vim wiki buffer from tabline in your work repo.
                if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                    return true
                end
            end,

	    --sort_by = function(buffer_a, buffer_b)
            --    -- Add custom logic.
            --    return buffer_a.modified > buffer_b.modified
            --end,

	    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
        }
    }
end

local meta = {
    "akinsho/nvim-bufferline.lua",
    config = config(),
    requires = require("plugins.nvim-web-devicons")
}

return meta

