syntax on
colorscheme molokai
let mapleader = ","

set number
set showcmd   "shows current command in the statusline
set exrc      "read <cwd>/.vimrc
set cursorline

set hlsearch  "highlights search results
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
hi QuickFixLine term=reverse ctermbg=52  "change QuickFix selected line color

set laststatus=2
set statusline=%f\:%l\:%c

highlight OverLength ctermbg=darkblue ctermfg=white guibg=#592929
match OverLength /\%81v/

filetype plugin indent on
set tabstop=4     " show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " On pressing tab, insert 4 spaces

let &grepprg='grep --exclude-dir .git --exclude-dir node_modules --exclude-dir dist --exclude *.swp -n $* /dev/null'

nnoremap gr :grep! -H -r <cword> * <CR><CR>:copen<CR>
nnoremap gb :ls<CR>:b<Space>
nnoremap <leader>c :copen<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>l :lopen<CR>
nnoremap <leader>k :lclose<CR>
nnoremap <leader>s :write<CR>
nnoremap <leader>q :noh<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-t> :tabnext<CR>


execute pathogen#infect() 

" Go
nnoremap gi :GoImplements<CR>
nnoremap gc :GoCallees<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0

hi SpellBad term=reverse ctermbg=red

" Rust
" Racer
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

