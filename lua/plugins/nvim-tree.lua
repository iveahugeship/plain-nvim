-- Nvim-Tree: a file explorer for Neovim written in lua.
-- More: https://github.com/kyazdani42/nvim-tree.lua

local function config()
    -- Tree customize.
    vim.g.nvim_tree_side = 'right'
    vim.g.nvim_tree_width = 40
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_add_trailing = 1
    vim.g.nvim_tree_follow = 1
    vim.g.nvim_tree_root_folder_modifier = ':t'
    vim.g.nvim_tree_highlight_opened_files = 1

    -- File ignoring.
    vim.g.nvim_tree_gitignore = 0
    vim.g.nvim_tree_hide_dotfiles = 0
    vim.g.nvim_tree_ignore = { '.git'}
    vim.g.nvim_tree_special_files = { 'README.md', 'Makefile'}
    vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }

    -- Auto close/open.
    vim.g.nvim_tree_auto_open = 1
    vim.g.nvim_tree_auto_close = 1
    vim.g.nvim_tree_quit_on_open = 0
    vim.g.nvim_tree_tab_open = 1

    -- Other function.
    vim.g.nvim_tree_disable_netrw = 0
    vim.g.nvim_tree_hijack_netrw = 1
    vim.g.nvim_tree_lsp_diagnostics = 1

    -- Icons.
    vim.g.nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1
    }
    vim.g.nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌'
        },
        folder = {
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = ''
        },
        lsp = {
            hint = '',
            info = '',
            warning = '',
            error = ''
        }
    }

    -- Key map.
    local tree = require('nvim-tree.config').nvim_tree_callback
    vim.cmd('nnoremap <C-f> :NvimTreeToggle<CR>')
    vim.g.nvim_tree_bindings = {
        ['e']		= tree('cd'),
        ['o']		= tree('edit'),
        ['v']		= tree('vsplit'),
        ['s']		= tree('split'),
        ['t']		= tree('tabnew'),
        ['<TAB>']	= tree('preview'),
        ['i']       = tree('toggle_ignored'),
        ['.']       = tree('toggle_dotfiles'),
        ['R']		= tree('refresh'),
        ['a']		= tree('create'),
        ['d']		= tree('remove'),
        ['r']		= tree('full_rename'),
        ['x']		= tree('cut'),
        ['y']		= tree('copy'),
        ['p']		= tree('paste')
    }
end

local meta = {
    'kyazdani42/nvim-tree.lua',
    config = config(),
    requires = require('plugins.nvim-web-devicons')
}

return meta

