local function map(mode, key, value)
  vim.keymap.set(mode, key, value, { silent = true })
end

map('i', 'jk', '<Esc>')
map('', '<C-n>', ':Neotree<CR>')
map('', '<C-t>', ':ToggleTerm<CR>')
