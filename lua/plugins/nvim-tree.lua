-- Nvim-Tree is a file explorer for Neovim written in Lua.
-- More: https://github.com/kyazdani42/nvim-tree.lua
require('plugins.plugin-manager').add_plugin('kyazdani42/nvim-tree.lua')


-- Keymaps
-- More: https://github.com/kyazdani42/nvim-tree.lua#keybindings
local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ['<S-o>'] = tree_cb('cd'),
  ['<C-o>'] = tree_cb('split'),
  ['<M-o>'] = tree_cb('vsplit'),
  ['<C-M-o>'] = tree_cb('tabnew'),
  ['<Tab>'] = tree_cb('preview'),
  ['x'] = tree_cb('cut'),
  ['y'] = tree_cb('copy'),
  ['d'] = tree_cb('remove'),
  ['a'] = tree_cb('create'),
  ['p'] = tree_cb('paste'),
  ['r'] = tree_cb('rename'),
  ['q'] = tree_cb('close'),
  ['H'] = tree_cb('toggle_dotfiles'),
  ['I'] = tree_cb('toggle_ignored'),
  ['R'] = tree_cb('refresh')
}

vim.api.nvim_set_keymap('', '<C-f>', ':NvimTreeToggle<CR>', {})


-- Settings.
-- More: https://github.com/kyazdani42/nvim-tree.lua#setup
vim.g.nvim_tree_width = 30 -- 30 by default, set tree width.
vim.g.nvim_tree_side = 'right' -- 'left' by default, set tree side.
vim.g.nvim_tree_width_allow_resize  = 1 -- 0 by default, not resize the tree when opening a file.

-- empty by default,
-- ignore specified files.
vim.g.nvim_tree_ignore = {
  '.git',
  '.gitignore'
}

vim.g.nvim_tree_auto_open = 1 -- 0 by default, open the tree when typing 'vim $DIR' or 'vim'.
vim.g.nvim_tree_auto_close = 1 -- 0 by default, close the tree when it's the last window.
vim.g.nvim_tree_tab_open  = 1 -- 0 by default, open the tree when entering a new tab and the tree was previously open.
--vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, close the tree when you open a file.
--vim.g.nvim_tree_auto_ignore_ft = {'startify', 'dashboard'} -- empty by default, not auto open tree on specific filetypes.

vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names.
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, show indent markers when folders are open.
vim.g.nvim_tree_root_folder_modifier = ':t' -- ':~' by default. See :help filename-modifiers for more options.
--vim.g.nvim_tree_lsp_diagnostics = 1 -- 0 by default, show lsp diagnostics in the tree. See :help nvim_tree_lsp_diagnostics.

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

