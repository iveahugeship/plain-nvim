-- This plugin provides a start screen.
-- More: https://github.com/mhinz/vim-startify
require('plugins.plugin-manager').add_plugin('mhinz/vim-startify')


-- Settings.
-- More: ':h startify'
vim.g.startify_custom_header = {
  ' ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
  ' ████╗  ██║██║   ██║██║████╗ ████║',
  ' ██╔██╗ ██║██║   ██║██║██╔████╔██║',
  ' ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  ' ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝'
}

vim.g.startify_lists = {
  { type='commands', header={'Commands'} },
  { type='sessions', header={'Sessions'} },
  { type='bookmarks', header={'Bookmarks'} }
}

vim.api.nvim_command(
  'let startify_bookmarks = [' ..
  '  {\'c\': \'~/.config/nvim/init.lua\'},' ..
  '  {\'p\': \'~/.config/nvim/lua/plugins/init.lua\'}' ..
  ']'
)

vim.api.nvim_command(
  'let startify_commands = [' ..
  '  \':help startify\',' ..
  '  \':help neovim-features\'' ..
  ']'
)

vim.g.startify_session_dir = '~/.config/nvim/sessions'
vim.g.startify_session_autoload = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_delete_buffers = 1

vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_enable_special = 0

