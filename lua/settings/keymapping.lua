-- Key Mapping.

-- NvimTree.
vim.api.nvim_set_keymap(
    'n',
    '<c-]>',
    ':BufferLineCycleNext<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<c-[>',
    ':BufferLineCyclePrev<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<c-p>',
    ':BufferLinePick<CR>',
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    'n',
    '<c-q>',
    ':bw<CR>',
    { noremap = true, silent = true }
)

