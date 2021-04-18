local mod = { }

mod.meta = {
    name = 'dylanaraps/fff.vim',
    source = 'https://github.com/dylanaraps/fff.vim',
    description = 'Fucking Fast File-Manager for Vim.',
    dependencies = {}
}

mod.init = function()
    vim.cmd('let g:fff#split = "50vnew"') -- Vertical Slit (NERDTree Style).
    vim.cmd('let g:fff#split_direction = "nosplitbelow splitright"') -- Split on the right side.

    vim.cmd('nnoremap f :F ./<CR>') -- Open fff.
end

return mod

