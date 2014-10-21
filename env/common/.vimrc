" ---- Color scheme ----
"
syntax enable
set background=dark
set t_Co=256

" molokai theme
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1


" ---- git branch information

let g:git_branch_status_head_current=0   "show just the current head branch
let g:git_branch_status_text=""          "show 'text' before the branches
let g:git_branch_status_nogit=""         "when there is no Git repo
let g:git_branch_status_around=""        "characters to put around the branch strings.
let g:git_branch_status_ignore_remotes=1 "ignore the remote branches.



filetype indent on

set autoindent
set number
set hlsearch
set wildmenu
set path=./**,../**,./modules/**,./testers/**,./SourceCode/**
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

map  :w!<CR>:!aspell check %<CR>:e! %<CR>

"Easy split navigation
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

"Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

"Use jk as <Esc> alternative
inoremap jk <Esc>


":au BufWinEnter *.v let w:m1=matchadd('Search', '\%<200v.\%>80v', -1)
:autocmd BufWinEnter *.v let w:m1=matchadd('Search', '\%>101v', -1)
:autocmd BufNewFile,BufRead *.v setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
:autocmd BufNewFile,BufRead *.lua setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3
:autocmd BufNewFile,BufRead *.c setlocal expandtab tabstop=3 shiftwidth=3 softtabstop=3

"augroup cpp
"autocmd!
autocmd BufNewFile,BufRead *.cpp set expandtab tabstop=3 shiftwidth=3 softtabstop=3
"augroup END


"set tabstop=4
"set shiftwidth=4
"set expandtab
setlocal tabstop=8
setlocal shiftwidth=8
setlocal noexpandtab

"setlocal
"set

" Show tabs and trailing spaces.
" Ctrl-K >> for »
" Ctrl-K .M for ·
" (use :dig for list of digraphs)
" set list listchars=tab:»-,trail:·
:autocmd BufNewFile,BufRead *.v setlocal list listchars=tab:»-,trail:·
:autocmd BufRead,BufNewFile *.rockspec set filetype=lua
:autocmd BufRead,BufNewFile *.sc set filetype=scheme
:autocmd BufRead,BufNewFile *.cl set filetype=opencl

" experiment for paste http://userobsessed.net/tips-and-tricks/2011/05/10/copy-and-paste-in-vim/
"<C-O>:set paste <CR><C-r>*<C-O>:set nopaste<CR>
"imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

"autocmd BufWritePre * :%s/\s\+$//        " remove whitespace
"set clipboard=unnamed                    " sync vim clipboard and Mac clipboard
