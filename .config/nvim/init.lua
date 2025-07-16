-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.compatible = false
vim.cmd('filetype plugin on')
vim.cmd('syntax on')
vim.opt.cursorline = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.background = "dark"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wildignore:append({".docx", ".jpg", ".png", ".gif", ".pdf", ".pyc", ".exe", ".flv", ".img", ".xlsx"})
vim.opt.guifont = "Monaco:h12:b"
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

-- Plugin manager (vim-plug equivalent in Lua: still needs plug.vim)
vim.cmd([[
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'ekalinin/dockerfile.vim'
Plug 'tpope/vim-fugitive'
Plug 'tc50cal/vim-terminal'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline-themes'
Plug 'edeneast/nightfox.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'

call plug#end()
]])

-- Mappings
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-r>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

-- Colorscheme
vim.cmd('colorscheme nightfox')

-- CoC Tab completion behavior
vim.cmd([[
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : CheckBackspace() ? "\<Tab>" : coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]])
