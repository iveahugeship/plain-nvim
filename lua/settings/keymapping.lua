-- Key Mapping.

-- NvimBufferline.
vim.api.nvim_set_keymap(
    'n',
    '<C-M-L>',
    ':BufferLineCycleNext<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-M-H>',
    ':BufferLineCyclePrev<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-p>',
    ':BufferLinePick<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<C-q>',
    ':bw<CR>',
    { noremap = true, silent = true }
)

-- Navigation.
vim.api.nvim_set_keymap(
    'n',
    '<C-j>',
    '<C-d>',
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<C-k>',
    '<C-u>',
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<C-M-j>',
    '<C-f>',
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<C-M-k>',
    '<C-b>',
    { noremap = true, silent = true }
)

-- NvimTree.
vim.api.nvim_set_keymap(
    'n',
    '<C-M-f>',
    ':NvimTreeToggle<CR>',
    { noremap = true, silent = true }
)

