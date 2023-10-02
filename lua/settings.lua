local opt = vim.opt
local api = vim.api

opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.cindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.mouse = "a"
opt.title = true

api.nvim_command("autocmd VimEnter * highlight Visual ctermbg=0 guibg=Black")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[colorscheme abstract]]
