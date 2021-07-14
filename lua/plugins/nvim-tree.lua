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
    vim.g.nvim_tree_auto_open = 0
    vim.g.nvim_tree_auto_close = 0
    vim.g.nvim_tree_quit_on_open = 1
    vim.g.nvim_tree_tab_open = 0

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
    vim.g.nvim_tree_bindings = {
        { key = {'e'},      cb = tree('cd') },
        { key = {'o'},      cb = tree('edit') },
        { key = {'s'},      cb = tree('split') },
        { key = {'v'},      cb = tree('vsplit') },
        { key = {'t'},      cb = tree('tabnew') },
        { key = {'<TAB>'},  cb = tree('preview') },
        { key = {'i'},      cb = tree('toggle_ignored') },
        { key = {'.'},      cb = tree('toggle_dotfiles') },
        { key = {'R'},      cb = tree('refresh') },
        { key = {'a'},      cb = tree('create') },
        { key = {'d'},      cb = tree('remove') },
        { key = {'r'},      cb = tree('full_rename') },
        { key = {'x'},      cb = tree('cut') },
        { key = {'y'},      cb = tree('copy') },
        { key = {'p'},      cb = tree('paste') }
    }
end

local meta = {
    'kyazdani42/nvim-tree.lua',
    config = config(),
    requires = require('plugins.nvim-web-devicons')
}

return meta

