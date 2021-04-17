-- dashboard-nvim - is start screen for NeoVim.
-- More: https://github.com/glepnir/dashboard-nvim

require('plugins.pmanager').add('glepnir/dashboard-nvim')

-- Set header.
vim.g.dashboard_custom_header = {
  '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
}

-- Set some sections.
vim.g.dashboard_custom_section = {
  a = {description = {'  New File                   ctrl-n  '}, command = 'enew'},
  b = {description = {'  Load Last Session          ctrl-l  '}, command = 'SessionLoad'},
  c = {description = {'  Recently Used Files        ctrl-f h'}, command = 'DashboardFindHistory'},
  d = {description = {'  Find File                  ctrl-f f'}, command = 'DashboardFindFile'},
  e = {description = {'  Find Word                  ctrl-f w'}, command = 'DashboardFindWord'},
  f = {description = {'ﰳ  Quit                       ctrl-q  '}, command = 'q!'}
}

-- Key Map.
-- FIXME: this binds work on first opened window.
vim.cmd('nnoremap <buffer> <C-n>  :enew<cr>')
vim.cmd('nnoremap <buffer> <C-l>  :SessionLoad<cr>') -- FIXME: sessions opened from dashboard doesn't saves.
vim.cmd('nnoremap <buffer> <C-f>h :DashboardFindHistory<cr>')
vim.cmd('nnoremap <buffer> <C-f>f :DashboardFindFile<cr>')
vim.cmd('nnoremap <buffer> <C-f>w :DashboardFindWord<cr>')
vim.cmd('nnoremap <buffer> <C-q>  :q!<cr>')

vim.g.dashboard_default_executive = 'telescope' -- Backend fuzzy finder utility.

vim.cmd('au BufUnload !dashboard :SessionSave') -- Save session after the buffer closing.
