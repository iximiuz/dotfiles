syntax on
colorscheme molokai
let mapleader = ","

set number
set showcmd   "shows current command in the statusline
set exrc      "read <cwd>/.vimrc
set cursorline
set ttyfast   "more characters will be sent to the screen for redrawing
set wildmenu  "a better menu in command mode
set wildmode=longest:full,full
set colorcolumn=81

set hlsearch  "highlights search results
hi Search ctermbg=DarkGray
hi Search ctermfg=Red
hi QuickFixLine term=reverse ctermbg=52  "change QuickFix selected line color

set laststatus=2
set statusline=%f\:%l\:%c\ \[%L\]

filetype plugin indent on
set tabstop=4     " show existing tab with 4 spaces width
set softtabstop=4
set shiftwidth=4  " when indenting with '>', use 2 spaces width
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
nnoremap <leader>e :Ex<CR>
nnoremap <leader>E :Vex<CR>
nnoremap <C-w> :q<CR>

"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-t> :tabnext<CR>

"move to the split in the direction shown, or create a new split
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction


execute pathogen#infect() 

" Ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Go
nnoremap gi :GoImplements<CR>
nnoremap gc :GoCallees<CR>
let g:go_def_mode = 'godef'

" syntastic
set statusline+=%=%#warningmsg#
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

