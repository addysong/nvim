vim.opt.timeout = false

vim.opt.termguicolors = true

vim.opt.swapfile = false

vim.opt.fixendofline = false -- Disable automatically adding newline to end of file

vim.opt.number = true -- Line numbering
vim.opt.relativenumber = true

vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
vim.g.netrw_banner = 0

vim.opt.undofile = true -- Save undo history

vim.opt.ignorecase = true -- Smart case searching
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes' -- Sign column

vim.opt.cursorline = true -- Highlight current line

vim.opt.scrolloff = 4 -- Scrolloff

vim.opt.linebreak = true -- Wrap at word instead of character
vim.opt.breakindent = true -- Indent other lines to same level

vim.opt.tabstop = 4 -- Visual size of tab characters
vim.opt.softtabstop = 4 -- Tab size using tab key (spaces)
vim.opt.shiftwidth = 4 -- Tab size using vim motions >, <, and = (spaces)
vim.opt.expandtab = true

vim.opt.colorcolumn = ''

-- Spell
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'cjk' }
vim.opt.spelloptions = 'camel'

-- Disable tab line at top of screen in Windows
vim.opt.showtabline = 0

vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
}

vim.opt.fillchars:append({ eob = ' ' })
