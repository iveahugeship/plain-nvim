-- Nvim-Tree is a file explorer for Neovim written in Lua.
-- More: https://github.com/kyazdani42/nvim-tree.lua

require('plugins.pmanager').add('kyazdani42/nvim-tree.lua')

-- Key Map.
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
  ['<C-h>'] = tree_cb('toggle_dotfiles'),
  ['<C-i>'] = tree_cb('toggle_ignored'),
  ['<C-r>'] = tree_cb('refresh')
}

vim.cmd('nnoremap <C-e>f :NvimTreeToggle<CR>') -- Toggle NvimTree.

-- Settings.
vim.g.nvim_tree_width = 30 -- Tree width.
vim.g.nvim_tree_side = 'right' -- Tree side.
vim.g.nvim_tree_width_allow_resize  = 1 -- Resize the tree when opening a file.

-- Ignore specified files.
vim.g.nvim_tree_ignore = {
  '.git',
  '.gitignore'
}

vim.g.nvim_tree_auto_open = 1 -- Open the tree when typing 'vim $DIR' or 'vim'.
vim.g.nvim_tree_auto_close = 1 -- Close the tree when it's the last window.
vim.g.nvim_tree_tab_open  = 0 -- Open the tree when entering a new tab and the tree was previously open.
--vim.g.nvim_tree_quit_on_open = 1 -- Close the tree when you open a file.
vim.g.nvim_tree_auto_ignore_ft = {'dashboard'} -- Don't open tree on specific filetypes.

vim.g.nvim_tree_add_trailing = 1 -- Append a trailing slash to folder names.
vim.g.nvim_tree_indent_markers = 1 -- Show indent markers when folders are open.
vim.g.nvim_tree_root_folder_modifier = ':t' -- See :help filename-modifiers for more options.
--vim.g.nvim_tree_lsp_diagnostics = 1 -- Show lsp diagnostics in the tree. See :help nvim_tree_lsp_diagnostics.

-- Set icon visibility.
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1
}

-- Set icons.
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

--vim.api.nvim_command('set termguicolors') -- This variable should be enabled for colors to be applied properly.
--vim.api.nvim_command('highlight NvimTreeFolderIcon guibg=blue') -- List of groups can be found at ':help nvim_tree_highlight'

