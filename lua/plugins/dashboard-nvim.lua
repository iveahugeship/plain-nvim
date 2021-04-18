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
  a = {description = {'  New File                   ctrl-e n '}, command = 'tabnew'},
  b = {description = {'  Load Last Session          ctrl-e l '}, command = 'SessionLoad'},
  c = {description = {'  Recently Used Files        ctrl-e h '}, command = 'DashboardFindHistory'},
  d = {description = {'  Find File                  ctrl-e f '}, command = 'DashboardFindFile'},
  e = {description = {'  Find Word                  ctrl-e w '}, command = 'DashboardFindWord'},
  f = {description = {'ﰳ  Quit                       ctrl-e q '}, command = 'q!'}
}

-- Key Map.
vim.cmd('au FileType dashboard nnoremap <buffer> <C-e>n :tabnew<cr>')
vim.cmd('au FileType dashboard nnoremap <buffer> <C-e>l :SessionLoad<cr>')
vim.cmd('au FileType dashboard nnoremap <buffer> <C-e>h :DashboardFindHistory<cr>')
vim.cmd('au FileType dashboard nnoremap <buffer> <C-e>f :DashboardFindFile<cr>')
vim.cmd('au FileType dashboard nnoremap <buffer> <C-e>w :DashboardFindWord<cr>')
vim.cmd('au FileType dashboard nnoremap <buffer> <C-e>q :q!<cr>')

vim.g.dashboard_default_executive = 'telescope' -- Backend fuzzy finder utility.

vim.cmd('au BufUnload * :silent SessionSave') -- Save session after the buffer closing.

