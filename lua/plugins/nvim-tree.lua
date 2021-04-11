-- Nvim-Tree is a file explorer for Neovim written in Lua.
-- More: https://github.com/kyazdani42/nvim-tree.lua

require('plugins.plugin-manager').add_plugin('kyazdani42/nvim-tree.lua')


-- Keymaps
vim.api.nvim_set_keymap('', '<C-f>', ':NvimTreeToggle<CR>', {})
vim.api.nvim_set_keymap('', '<C-M-f>', ':NvimTreeRefresh<CR>', {})


-- Settings.
--vim.g.nvim_tree_width = 40 -- 30 by default, set tree width.
vim.g.nvim_tree_width_allow_resize  = 1 -- 0 by default, not resize the tree when opening a file.
--vim.g.nvim_tree_side = 'right' -- 'left' by default, specify tree position.
--vim.g.nvim_tree_follow = 1 -- 0 by default, allow the cursor to be updated when entering a buffer.

-- empty by default,
-- ignore specified files.
vim.g.nvim_tree_ignore = {
--  '.git',
--  'node_modules',
--  '.cache'
}
--vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, hide files and folders starting with a dot '.'.

vim.g.nvim_tree_auto_open = 1 -- 0 by default, open the tree when typing 'vim $DIR' or 'vim'.
vim.g.nvim_tree_auto_close = 1 -- 0 by default, close the tree when it's the last window.
vim.g.nvim_tree_tab_open  = 1 -- 0 by default, open the tree when entering a new tab and the tree was previously open.
--vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, close the tree when you open a file.
--vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'} -- empty by default, not auto open tree on specific filetypes.

vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names.
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, show indent markers when folders are open.
vim.g.nvim_tree_git_hl = 1 -- 0 by default, enable file highlight for git attributes (can be used without the icons).
--vim.g.nvim_tree_root_folder_modifier = ':~' -- ':~' by default. See :help filename-modifiers for more options.
--vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree.
--vim.g.nvim_tree_lsp_diagnostics = 1 -- 0 by default, show lsp diagnostics in the tree. See :help nvim_tree_lsp_diagnostics.

--vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disable netrw.
--vim.g.nvim_tree_hijack_netrw = 0 -- 1 by default, prevent netrw from automatically opening when opening directories (but let you keep its other utilities).

-- 1 by default for each,
-- 1 - show icon for entry ('nvim-web-devicons is required')
-- 0 - not show icon for entry.
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

-- by default show default icons
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  }
}

--vim.api.nvim_command('set termguicolors') -- this variable must be enabled for colors to be applied properly.
--vim.api.nvim_command('highlight NvimTreeFolderIcon guibg=blue') -- a list of groups can be found at ':help nvim_tree_highlight'

