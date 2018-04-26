syntax on
colorscheme molokai

set number
set showcmd   "shows current command in the statusline
set exrc      "read <cwd>/.vimrc

set hlsearch  "highlights search results
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi QuickFixLine term=reverse ctermbg=52  "change QuickFix selected line color

set laststatus=2
set statusline=%f\:%l\:%c

set colorcolumn=100

filetype plugin indent on
set tabstop=4     " show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " On pressing tab, insert 4 spaces

let &grepprg='grep --exclude-dir .git --exclude-dir node_modules --exclude-dir dist -n $* /dev/null'

:nnoremap gr :grep! --exclude *.swp -H -r <cword> * <CR><CR>:copen<CR>
:nnoremap <leader>r :copen<CR>

execute pathogen#infect() 

