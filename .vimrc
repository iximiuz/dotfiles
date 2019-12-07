syntax on
colorscheme slate
let mapleader = ","

set number
set showcmd   "shows current command in the statusline
set exrc      "read <cwd>/.vimrc
set cursorline
set ttyfast   "more characters will be sent to the screen for redrawing
set wildmenu  "a better menu in command mode
set wildmode=longest:full,full
set colorcolumn=81
highlight ColorColumn ctermbg=235 guibg=#2c2d27

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

set completeopt-=preview

let &grepprg='grep --exclude-dir .git --exclude-dir node_modules --exclude-dir dist --exclude *.swp -n $* /dev/null'

nnoremap gr :grep! -H -r <cword> * <CR><CR>:copen<CR>
nnoremap gb :ls<CR>:b<Space>
nnoremap <leader>s :write<CR>
nnoremap <leader>q :noh<CR>
nnoremap <leader>w :q<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>E :Vex<CR>

nnoremap <leader>c :copen<CR>
nnoremap <leader>a :cclose<CR>
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

"navigate in command mode - emacs style
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

execute pathogen#infect() 

" ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_match_window = 'min:4,max:10,results:100'

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
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go'] " Go support

hi SpellBad term=reverse ctermbg=red

" Rust
" Racer
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

