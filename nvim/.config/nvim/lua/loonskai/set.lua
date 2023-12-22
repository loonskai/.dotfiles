vim.opt.scrolloff=8
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.smartindent=true
vim.opt.background='dark'


local anki_as_md = 'au BufNewFile,BufFilePre,BufRead *.anki set filetype=markdown'
vim.api.nvim_command(anki_as_md)
